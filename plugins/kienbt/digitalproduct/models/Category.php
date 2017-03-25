<?php namespace Kienbt\Digitalproduct\Models;

use Cms\Classes\Controller;
use InvalidArgumentException;
use Model;
use Db;
use Kienbt\Digitalproduct\Models\Product;
use October\Rain\Support\Collection;

/**
 * Model
 */
class Category extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\NestedTree;

    /*
     * Validation
     */
    public $rules = [
        'name' => 'required',
        'slug' => ['required', 'regex:/^[a-z0-9\/\:_\-\*\[\]\+\?\|]*$/i', 'unique:kienbt_digitalproduct_categories'],
    ];

    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = true;

    /**
     * @var string The database table used by the model.
     */
    public $table = 'kienbt_digitalproduct_categories';

    // public $belongsToMany = [
    //     'products' => [
    //         'Kienbt\Digitalproduct\Models\Product',
    //         'table'    => 'kienbt_digitalproduct_category_product',
    //         'key'      => 'category_id',
    //         'otherKey' => 'product_id',
    //     ],
    // ];
    public $hasMany = [
        'product' => 'Kienbt\Digitalproduct\Models\Product'
    ];

    /**
     * Returns an array with possible parent categories.
     *
     * If we are in create mode (no id) all categories are returned.
     * If an id is set, we need to exclude the current node itself to
     * prevent an infinite parent-child relationship.
     *
     * @return array
     */
    public function getParentOptions()
    {
        $options = [
            // null key for "no parent"
            null => '(' . trans('kienbt.digitalproduct::lang.plugin.common.no_parent') . ')',
        ];

        // In edit mode, exclude the node itself.
        $items = $this->id ? Category::withoutSelf()->get() : Category::getAll();
        $items->each(function ($item) use (&$options) {
            return $options[$item->id] = sprintf('%s %s', str_repeat('--', $item->getLevel()), $item->name);
        });

        return $options;
    }

    public static function getMenuTypeInfo($type)
    {
        $result = [];
        if ($type == 'all-product-categories') {
            $result = [
                'dynamicItems' => true,
            ];
        }

        return $result;
    }
    public static function resolveMenuItem($item, $url, $theme)
    {
        $structure = [];
        $category  = new Category();

        $productCount = Db::table('kienbt_digitalproduct_products')
                    ->select('category_id', Db::raw('count(*) as num'))
                    ->where('published',1)
                    ->groupBy('category_id')
                    ->get();
        $collection = new Collection($productCount);
        $productCount = $collection->keyBy('category_id');

        $pageSlug = 'slug';

        if ( ! $pageUrl = 'category') {
            throw new InvalidArgumentException(
                'Please select a category page via the backend settings.'
            );
        }

        $iterator = function ($items, $baseUrl = '') use (&$iterator, &$structure, $pageUrl, $pageSlug, $url, $productCount) {
            $branch = [];

            $controller = new Controller();
            foreach ($items as $item) {

                // Prepend the parent categories slug if available
                $slug = $baseUrl ? $baseUrl . '/' . $item->slug : $item->slug;

                $entryUrl               = $controller->pageUrl($pageUrl, [$pageSlug => $slug]);
                $branchItem             = [];
                $branchItem['id']       = $item->id;
                $branchItem['url']      = $entryUrl;
                $branchItem['isActive'] = $entryUrl === $url;
                $branchItem['title']    = $item->name;
                $branchItem['count']    = 0;

                //count number product published in category
                if ($item->isRoot()) {
                    $childCatId = $item->getAllChildrenAndSelf()->lists('id');
                    for ($i=0; $i < count($childCatId); $i++) { 
                        if (isset($productCount[$childCatId[$i]])) {
                            $branchItem['count'] += $productCount[$childCatId[$i]]->num;
                        }
                    }
                } else {
                    if (isset($productCount[$item->id])) {
                        $branchItem['count'] += $productCount[$item->id]->num;
                    }
                }

                if ($item->children) {
                    $branchItem['items'] = $iterator($item->children, $item->slug);
                }

                $branch[] = $branchItem;
            }

            return $branch;
        };
        $structure['items'] = $iterator($category->getEagerRoot());
dd($structure);
        return $structure;
    }

    public static function allowedSortingOptions()
    {
        $name    = trans('kienbt.digitalproduct::lang.plugin.product.name');
        $created = trans('kienbt.digitalproduct::lang.plugin.common.created_at');

        return [
            'name asc'        => "${name}, A->Z",
            'name desc'       => "${name}, Z->A",
            'created_at asc'  => "${created}, A->Z",
            'created_at desc' => "${created}, Z->A",
        ];
    }
}
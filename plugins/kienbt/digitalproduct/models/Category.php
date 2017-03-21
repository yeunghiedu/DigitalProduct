<?php namespace Kienbt\Digitalproduct\Models;

use Cms\Classes\Controller;
use InvalidArgumentException;
use Model;

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

        $pageSlug = 'slug';

        if ( ! $pageUrl = 'category') {
            throw new InvalidArgumentException(
                'Please select a category page via the backend settings.'
            );
        }

        $iterator = function ($items, $baseUrl = '') use (&$iterator, &$structure, $pageUrl, $pageSlug, $url) {
            $branch = [];

            $controller = new Controller();
            foreach ($items as $item) {

                // Prepend the parent categories slug if available
                $slug = $baseUrl ? $baseUrl . '/' . $item->slug : $item->slug;

                $entryUrl               = $controller->pageUrl($pageUrl, [$pageSlug => $slug]);
                $branchItem             = [];
                $branchItem['url']      = $entryUrl;
                $branchItem['isActive'] = $entryUrl === $url;
                $branchItem['title']    = $item->name;

                if ($item->children) {
                    $branchItem['items'] = $iterator($item->children, $item->slug);
                }

                $branch[] = $branchItem;
            }

            return $branch;
        };

        $structure['items'] = $iterator($category->getEagerRoot());

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
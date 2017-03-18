<?php namespace Kienbt\Digitalproduct\Models;

use Model;
use October\Rain\Database\Traits\Validation;
use October\Rain\Exception\ValidationException;
use System\Models\File;
use Kienbt\Digitalproduct\Models\Category;

/**
 * Model
 */
class Product extends Model
{
    use Validation;

    /*
     * Validation
     */
    public $rules = [
        'name'  => 'required',
        'slug'  => ['required', 'regex:/^[a-z0-9\/\:_\-\*\[\]\+\?\|]*$/i', 'unique:kienbt_digitalproduct_products'],
        'price' => 'required',
    ];

    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = true;

    /**
     * @var string The database table used by the model.
     */
    public $table = 'kienbt_digitalproduct_products';

    // public $belongsToMany = [
    //     'categories' => [
    //         'Kienbt\Digitalproduct\Models\Category',
    //         'table'    => 'kienbt_digitalproduct_category_product',
    //         'key'      => 'product_id',
    //         'otherKey' => 'category_id',
    //     ]
    // ];
    public $belongsTo = [
        'category' => ['Kienbt\Digitalproduct\Models\Category']
    ];

    public $attachOne = [
        'images' => 'System\Models\File',
    ];

    public $attachMany = [
        'sub_image'    => 'System\Models\File',
        'download' => 'System\Models\File',
    ];

    public function scopePublished($query)
    {
        return $query->where('published', true);
    }
    public function getCategoryIdOptions()
    {
        $options = [
            // null key for "no parent"
            null => '(' . trans('kienbt.digitalproduct::lang.plugin.common.no_parent') . ')',
        ];
        $category = new Category();
        // In edit mode, exclude the node itself.
        $items = $category->getAll();
        $items->each(function ($item) use (&$options) {
            return $options[$item->id] = sprintf('%s %s', str_repeat('--', $item->getLevel()), $item->name);
        });

        return $options;
    }
}
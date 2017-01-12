<?php namespace Kienbt\Digitalproduct\Models;

use Model;
use October\Rain\Database\Traits\Validation;
use October\Rain\Exception\ValidationException;
use System\Models\File;

/**
 * Model
 */
class Productversion extends Model
{
    use Validation;

    /*
     * Validation
     */
    public $rules = [
    ];

    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = true;

    /**
     * @var string The database table used by the model.
     */
    public $table = 'kienbt_digitalproduct_product_version';

    public $belongsTo = [
        'products' => [
            'Kienbt\Digitalproduct\Models\Product',
            'table'    => 'kienbt_digitalproduct_products',
            'key'      => 'product_id',
        ]
    ];

    public $attachOne = [
        'downloads' => 'System\Models\File',
        'virus_image' => 'System\Models\File',
    ];
}
<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductCategoryProduct extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_category_product', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->integer('category_id')->unsigned();
            $table->integer('product_id')->unsigned();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_category_product');
    }
}

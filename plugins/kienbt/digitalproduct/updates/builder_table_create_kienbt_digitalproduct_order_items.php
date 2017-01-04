<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductOrderItems extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_order_items', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->uuid('unique_id');
            $table->integer('product_id');
            $table->integer('order_id');
            $table->string('name');
            $table->float('total_price');
            $table->timestamp('added_on');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_order_items');
    }
}
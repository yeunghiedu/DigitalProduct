<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductProductVersion extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_product_version', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->integer('product_id')->unsigned();
            $table->string('name');
            $table->timestamps();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_product_version');
    }
}
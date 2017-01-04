<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductProducts extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_products', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('user_defined_id')->nullable();
            $table->string('name');
            $table->string('slug', 255)->unique();
            $table->float('price');
            $table->string('description_short')->nullable();
            $table->text('description')->nullable();
            $table->string('meta_title')->nullable();
            $table->text('meta_description')->nullable();
            $table->boolean('published')->default(false);
            $table->timestamps();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_products');
    }
}
<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductCategories extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_categories', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name', 255);
            $table->string('slug', 255)->unique();
            $table->string('meta_title');
            $table->text('meta_description');
            $table->integer('sort_order');
            $table->timestamps();
            $table->integer('parent_id')->nullable();
            $table->integer('nest_left')->nullable();
            $table->integer('nest_right')->nullable();
            $table->integer('nest_depth')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_categories');
    }
}
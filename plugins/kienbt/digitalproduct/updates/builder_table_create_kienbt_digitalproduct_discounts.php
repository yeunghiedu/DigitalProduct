<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductDiscounts extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_discounts', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->string('guid');
            $table->string('name');
            $table->string('code');
            $table->integer('product_id')->nullable();
            $table->decimal('total_to_reach', 10, 0)->nullable();
            $table->string('type')->default('Rate');
            $table->string('trigger')->default('Code');
            $table->integer('rate')->nullable()->unsigned();
            $table->decimal('amount', 10, 0)->nullable();
            $table->decimal('alternate_price', 10, 0)->nullable();
            $table->integer('max_number_of_usages')->nullable()->unsigned();
            $table->dateTime('expires')->nullable();
            $table->integer('number_of_usages')->nullable()->unsigned();
            $table->integer('number_of_usages_uncompleted')->nullable()->unsigned();
            $table->timestamps();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_discounts');
    }
}
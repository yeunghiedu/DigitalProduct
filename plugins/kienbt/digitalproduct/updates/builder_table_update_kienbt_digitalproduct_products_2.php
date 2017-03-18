<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateKienbtDigitalproductProducts2 extends Migration
{
    public function up()
    {
        Schema::table('kienbt_digitalproduct_products', function($table)
        {
            $table->integer('category_id')->nullable()->unsigned();
            $table->string('demo_url', 500)->change();
        });
    }
    
    public function down()
    {
        Schema::table('kienbt_digitalproduct_products', function($table)
        {
            $table->dropColumn('category_id');
            $table->string('demo_url', 500)->change();
        });
    }
}

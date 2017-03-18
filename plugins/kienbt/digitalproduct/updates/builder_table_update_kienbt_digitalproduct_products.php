<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateKienbtDigitalproductProducts extends Migration
{
    public function up()
    {
        Schema::table('kienbt_digitalproduct_products', function($table)
        {
            $table->string('demo_url', 500);
            $table->dropColumn('description_short');
        });
    }
    
    public function down()
    {
        Schema::table('kienbt_digitalproduct_products', function($table)
        {
            $table->dropColumn('demo_url');
            $table->string('description_short', 255)->nullable();
        });
    }
}

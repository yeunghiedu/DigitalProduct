<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableUpdateKienbtDigitalproductCategories extends Migration
{
    public function up()
    {
        Schema::table('kienbt_digitalproduct_categories', function($table)
        {
            $table->integer('count')->unsigned()->default(0);
        });
    }
    
    public function down()
    {
        Schema::table('kienbt_digitalproduct_categories', function($table)
        {
            $table->dropColumn('count');
        });
    }
}
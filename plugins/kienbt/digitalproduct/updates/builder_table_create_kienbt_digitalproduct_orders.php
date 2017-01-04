<?php namespace Kienbt\Digitalproduct\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateKienbtDigitalproductOrders extends Migration
{
    public function up()
    {
        Schema::create('kienbt_digitalproduct_orders', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->uuid('token')->unique();
            $table->string('invoice_number');
            $table->timestamp('creation_date');
            $table->string('status');
            $table->string('email');
            $table->string('phone');
            $table->float('items_total');
            $table->float('subtotal');
            $table->text('notes')->nullable();
            $table->string('ip_address');
            $table->uuid('user_id');
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('kienbt_digitalproduct_orders');
    }
}
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderitemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    //tạo các cột trên php myadmin bằng cái này 
    //xong dùng lệnh php artisan migrate để tạo bảng có những cột này 
    public function up()
    {
        Schema::create('orderitems', function (Blueprint $table) {
            $table->id();
            $table->integer('order_id');
            $table->integer('product_id');
            $table->integer('qty');
            $table->integer('price');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orderitems');
    }
}

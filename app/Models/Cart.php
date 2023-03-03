<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    protected $table = 'carts';
    protected $filltable = [
        'user_id',
        'product_id',
        'product_qty',
    ];
    
    protected $with = ['product'];
    public function product()
    {
        //Cart model sẽ match cột user_id với 1 giá trị id ở product model
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}

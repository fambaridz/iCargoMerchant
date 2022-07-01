<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $table = 'booking';

    protected $fillable = [
        'order_name',
        'email',
        'sender_location',
        'recipient_location',
        'length',
        'width',
        'height',
        'weight',
        'time',
        'remarks',
        'price',
        'mode_of_payment',
    ];
}

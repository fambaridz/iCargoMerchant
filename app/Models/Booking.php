<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    protected $table = 'booking';

    protected $fillable = [
        'merchant_id',
        'sender_location',
        'sender_contact',
        'recipient_location',
        'recipient_contact',
        'vehicle',
        'length',
        'width',
        'height',
        'weight',
        'cargo_type',
        'time',
        'distance',
        'inclusions',
        'remarks',
        'price',
        'mode_of_payment',
        'status',
    ];


    protected $primaryKey = 'order_number';

}

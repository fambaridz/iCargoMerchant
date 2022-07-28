<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Testbooking extends Model
{
    use HasFactory;

    protected $table = 'test_booking';

    protected $fillable = [
        'sender_loc',
        'sender_num',
        'sender_name',
        'recipient_name',
        'recipient_loc',
        'recipient_num',
        'vehicle_type',
        'length',
        'width',
        'height',
        'weight',
        'cargo_type',
        'remarks',
        'mode_payment',
        
    ];


    protected $primaryKey = 'book_id';

}

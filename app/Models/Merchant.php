<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Merchant extends Model
{
    use HasFactory;

    protected $table = 'merchant';

    protected $fillable = [
        'id',
        'email',
        'password',
        'first_name',
        'last_name',
        'contact_number',
        'name_of_business',
        'about'

    ];
}

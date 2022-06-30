<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Billing extends Model
{
    use HasFactory;

    protected $table = 'billing';

    protected $fillable = [
        'service',
        'service_type',
        'cargo_type',
        'vehicle_type',
        'kilometer_kilo',

    ];




}

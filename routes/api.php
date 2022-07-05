<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\IdentificationController;






/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function(Request $request) {
    return $request->user();
});

Route::post('/booking', [BookingController::class, 'insertBooking']);

Route::post('/merchantsignup', [IdentificationController::class,'create']);

Route::post('/merchantlogin', [IdentificationController::class,'logIn']);

Route::get('/displaydata', [BookingController::class, 'display']);

Route::get('/verify', [IdentificationController::class, 'verifymerchant']);


Route::group(['middleware' =>['auth:sanctum']],function(){

    Route::get('/merchantlogout', [IdentificationController::class,'logout']);

});

Route::put('/merchantupdate/{id}', [IdentificationController::class, 'update']);

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use Illuminate\Support\Facades\Validator;

//IMPORT DB IF YOU USE DB FOR QUERYING
use Illuminate\Support\Facades\DB;

class BookingController extends Controller
{
    //

    public function insertBooking(Request $request){

        $validated =Validator::make($request->all(), [
            'email' => 'required|email',
            'sender_location' => 'required',
            'recipient_location' => 'required',
            'length' => 'required',
            'width' => 'required',
            'height' => 'required',
            'weight' => 'required',
            'time' => 'required',
            'remarks' => 'required',
            'price' => 'required',
            'mode_of_payment' => 'required',
        ]); //This is the code for validation of every request

        if ($validated->fails()) { //if validation fails this will return the error response
            $responseArr['message'] = $validated->errors();
        return response()->json($responseArr);

        }
        //if correct, it will insert in the table of booking
         $bookingTable = DB::table('booking')->insert(
            [
          
                'email' => $request->email,
                'sender_location' => $request->sender_location,
                'recipient_location' => $request->recipient_location,
                'length' =>$request->length,
                'width' => $request->width,
                'height' => $request->height,
                'weight' => $request->weight,
                'time' =>$request->time ,
                'remarks' => $request->remarks,
                'price' => $request->price,
                'mode_of_payment' => $request->mode_of_payment, //change this to finalgrade
        ]);
        //it will return status 200 if it was inserted in the DB  and 500 if inserting doesnt success
        if ($bookingTable) {
            return response()->json
            ([
                'success'=>$bookingTable,
                'message'=>'successfully inserted',
                ]
                ,200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Failed to insert',
            ], 500);
        } 
    }


}

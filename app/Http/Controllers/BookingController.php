<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\Cargo;
use App\Models\Vehicle;
use App\Models\Testbooking;
use Illuminate\Support\Facades\Validator;

//IMPORT DB IF YOU USE DB FOR QUERYING
use Illuminate\Support\Facades\DB;

class BookingController extends Controller
{
    //

    public function insertBooking(Request $request)
    {

        //This is the code for validation of every request
        $validated = Validator::make($request->all(), [
            'sender_loc' => 'required',
            'sender_name' => 'required',
            'sender_num' => 'required|digits:10',
            'recipient_loc' => 'required',
            'recipient_name' => 'required',
            'recipient_num' => 'required|digits:10',
            'vehicle_type' => 'required',
            'length' => 'required|numeric',
            'width' => 'required|numeric',
            'height' => 'required|numeric',
            'weight' => 'required|numeric',
            'cargo_type' => 'required',
            'mode_payment' => 'required',
        ]);

        //if validation fails this will return the error response
        if ($validated->fails()) { 
            $responseArr['message'] = $validated->errors();
            return response()->json($responseArr);
        }

        //if correct, it will insert in the table of booking
        $bookingTable = DB::table('booking')->insert(
            [
                'sender_loc' => $request->sender_loc,
                'sender_name' => $request->sender_name,
                'sender_num' => $request->sender_num,
                'recipient_loc' => $request->recipient_loc,
                'recipient_name' => $request->recipient_name,
                'recipient_num' => $request->recipient_num,
                'vehicle_type' => $request->vehicle_type,
                'length' => $request->length,
                'width' => $request->width,
                'height' => $request->height,
                'weight' => $request->weight,
                'cargo_type' => $request->cargo_type,
                'mode_payment' => $request->mode_payment,
            ]
        );

        //it will return status 200 if it was inserted in the DB and 500 if inserting is not successful
        if ($bookingTable) {
            return response()->json(
                [
                    'success' => $bookingTable,
                    'message' => 'successfully inserted',
                ],
                200
            );
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Failed to insert',
            ], 500);
        }
    }
    
    //function to display contents of cargo and vehicle table
    public function displayOptions(){

        $vehicle = DB::table('vehicle')->get('vehicle_type');
        $cargo = DB::table('cargo')->get('cargo_type');
        $mode = DB::table('mode_of_payment')->get('ModePay');

        //will return status 200 containing the contents of the database
        return response()->json
            ([
                'Vehicles'=>$vehicle,
                'CargoType'=>$cargo,
                'ModePay'=>$mode,
                ]
                ,200);
    }

    public function displayBooking(Request $request,$merchantid){
        //get booking condition to same of email
       // $bookingGet = DB::table('booking')->where('email',$email)->get();
                                 //OR
     $bookingGet = DB::table('booking')->where('merchant_id',$merchantid)->where('status','complete')->get();


     $ship = DB::table('booking')->where('merchant_id',$merchantid)->where('status','ship')->get();


     $ongoing = DB::table('booking')->where('merchant_id',$merchantid)->where('status','ongoing')->get();


     $cancel = DB::table('booking')->where('merchant_id',$merchantid)->where('status','cancel')->get();

        //get booking condition to same order number
       // $bookingGet = DB::table('booking')->where('order_number',$order_number)->get();

//if booking get        
        if ($bookingGet || $ship || $ongoing || $cancel) {
            return response()->json(
              ['complete' => $bookingGet, 'ship' =>  $ship, 'ongoing' =>  $ongoing, 'cancel' =>  $cancel ]
            );
        } else {
            //if query failed
            return response()->json([
                'success' => false,
                'message' => 'Failed to get',
            ], 500);
        }   

    }
}

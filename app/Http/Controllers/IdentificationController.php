<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Merchant;
use Illuminate\Support\Facades\Hash;

//IMPORT DB IF YOU USE DB FOR QUERYING
use Illuminate\Support\Facades\DB;

class IdentificationController extends Controller
{
    //

    public function create(Request $request){

        //This is the code for validation of every request
        $validated =\Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email',
            'contact_number' => 'required',
            'name_of_business' => 'required',
            'password' => 'required|confirmed',
            'about' => 'required',
        ]); 

        //if validation fails this will return the error response
        if ($validated->fails()) { 
            $responseArr['message'] = $validated->errors();
        return response()->json($responseArr);
        }

        //if correct, it will insert in the table of merchant
         $merchantTable = DB::table('merchant')->insert(
            [
          
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'contact_number' => $request->contact_number,
            'name_of_business' => $request->name_of_business,
            'password' => $request->password,
            'about' => $request->about,
        ]);

        //it will return status 200 if it was inserted in the DB and 500 if inserting is not successful
        if ($merchantTable) {
            return response()->json
            ([
                'success'=>$merchantTable,
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

    function logIn(Request $request){

        $validated =\Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|min:6|max:12',
        ]);

        //if validation fails this will return the error response
        if ($validated->fails()) {                                              
            $responseArr['message'] = $validated->errors();
        return response()->json($responseArr);
        }

        $user=Merchant::where('email', $request->email)->first();                   //requesting first the email                  

        //print_r($data)
        if(!$user || Hash::check($request->password, $user->password)){
            return response([
                'message' =>['These credentials do not match our records.']         //if email & password did not match
            ], 404);
        } else {
            return response([
                'message' =>['Log In Successs.']                                    //success log in message
            ], 201);
        }
    }
}

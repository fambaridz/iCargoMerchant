<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Merchant;

//IMPORT DB IF YOU USE DB FOR QUERYING
use Illuminate\Support\Facades\DB;

class SignUp extends Controller
{
    //

    public function create(Request $request){

        $validated =\Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email',
            'contact_number' => 'required',
            'name_of_business' => 'required',
            'password' => 'required|confirmed',
            'about' => 'required',
        ]); //This is the code for validation of every request


        if ($validated->fails()) { //if validation fails this will return the error response
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
        //it will return status 200 if it was inserted in the DB  and 500 if inserting doesnt success
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


}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Merchant;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
    function logIn(Request $request){

        $validated =\Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|min:6|max:12',
        ]);

        if ($validated->fails()) {                                              //if validation fails this will return the error response
            $responseArr['message'] = $validated->errors();
        return response()->json($responseArr);

        }

        $user=Merchant::where('email', $request->email)->first();                  // requesting first the email

        //print_r($data)
        if(!$user || Hash::check($request->password, $user->password) ){
            return response([
                'message' =>['These credentials do not match our records.']         //  if email & pass didnt matched
            ], 404);
        }else{
            return response([
                'message' =>['Log In Successs.']                                    // Succes log in message
            ], 201);
        }
  
    }
}



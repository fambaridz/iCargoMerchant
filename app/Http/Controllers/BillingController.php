<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//IMPORT THE MODELS IF YOU MAKE MODEL
use App\Models\Billing;

//IMPORT DB IF YOU USE DB FOR QUERYING
use Illuminate\Support\Facades\DB;

class BillingController extends Controller
{
    //Function 

    public function index(Request $request){
        
    
     //CODE 
      $var= DB::table('billing')->get();
       
    
      //RETURN THE DATA AND PARSE INTO JSON
        return response()->json($billing);
    }

    //Function

    public function getBilling(Request $request){

        $var = DB::table('orders')->get();

        return  response()->json($var);
        
    }


  

       
    

   
}

<template>
    <div class="booking">
        <div>

  </div>

            <!-- <b-form v-if="show"> -->
<center>
                <!--LOCATION FORM -->
                <div class="container location">
                    <div class="row">

                        <div class="col-auto col-lg-2 loc">
                            <div class="inputstyle" id="input">
                                <h3><i class="fa-regular fa-circle"></i></h3>
                                <pre style="font-size:8px;"><b>|<br>|<br>|</b></pre>
                                <h3><i class="fa-solid fa-box"></i></h3>
                                <pre style="font-size:8px;"><b>|<br>|<br>|</b></pre>
                                <h3><i class="fa-solid fa-location-dot"></i></h3>
                            </div>
                        </div>

                        <div class="col loc">
                            <br><br>
                             <b-form-group for="validationDefault01" id="input-group-1" label-for="input-1"
                                class="font-weight-bold text-primary inputloc">
                                <b-form-input id="input" v-model="form.sender_loc"
                                    name="senderloc" placeholder="Sender's Location" required></b-form-input>
                            </b-form-group>
                            <br><br>
                            <b-form-group id="input-group-2" label-for="input-2" class="font-weight-bold text-primary inputloc">
                                <b-form-input id="input" v-model="form.recipient_loc"
                                    name="recipientloc" placeholder="Recipient's Location" prepend="@" required></b-form-input>
                            </b-form-group>
                        </div>
                    </div>
                </div>
                <!-- LOCATION FORM -- END CODE -->
         </center>
                <br>
<!--For contacts-->
    <div class="container-fluid contact">
        <h3 style="text-align:left; padding-bottom:.3rem;padding-top:.3rem;">Contacts</h3>
    </div>
    <!--Sender Location-->
    <div class="container-fluid sender">
    <h4 style="color:black; text-align:left;">Sender</h4>
      <b-form-input id="input" v-model="form.sender_name" name="sender_name" placeholder="Sender's Name" ></b-form-input>
        <br>
      <div class="input-group mb-3" >
  <div class="input-group-prepend">
    <span class="input-group-text">+63</span>
  </div>
  <input type="number"  class="form-control" id="num" v-model="form.sender_num" name="sender_number">
</div>
        <br>
        <!--Recipients Location-->
        <h4 style="color:black; text-align:left;">Recipient</h4>
      <b-form-input id="input" v-model="form.recipient_name" name="recipient_name" placeholder="Recipient's Name" ></b-form-input>

    <br><div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">+63</span>
  </div>
  <input type="number" class="form-control" id="num" v-model="form.recipient_num" name="recipient_number">
</div>

  <!--Responsible for payment-->
  <div>
        <span id="userone">Responsible for payment</span>
        <input class="form-check-input" v-model="form.checked" type="checkbox" id="checkboxNoLabel" value="" aria-label="..."  style="color:#003060;float:left;margin-right:2rem;"/>
        
</div>
     
    </div>
    <!--Package Specification-->
    <div class="container-fluid contact">
        <h3 style="text-align:left; padding-bottom:.3rem;padding-top:.3rem;">Package Specification</h3>
    </div>
    <div class="container-fluid sender">
        <center>
            <br>
         <!-- VEHICLE TYPE DROPDOWN -->
         <div class="container titletwo" style="">
                    <v-app class="form">
                    <label id="label" class="text-center text-muted required mb-2">
                    WHOLE VEHICLE
                    </label>
                    <v-select
                    v-model="form.vehicle_type"
                    label="Choose Vehicle Type"
                    class="select d-flex"
                    background-color="#eef5fd"
                    :items="vehicles"
                    item-text="vehicle_type"
                    solo
                    rounded
                    >
                    </v-select>
                    </v-app>
                    </div>
                    <!-- VEHICLE TYPE DROPDOWN -- END CODE -->
                
                    <!-- CARGO TYPE DROPDOWN -->
                <br>
                    <div class="container titletwo">
                    <v-app class="form">
                    <label id="label" class="text-center text-muted required mb-2">
                    CARGO TYPE
                    </label>
                    <v-select
                    v-model="form.cargo_type"
                    label="Choose Cargo Type"
                    class="select d-flex"
                    background-color="#eef5fd"
                    :items="cargos"
                    item-text="cargo_type"
                    solo
                    rounded
                    >
                    </v-select>
                    </v-app>
                    </div>
              </center>  
              <!-- LENGTH - WIDTH - HEIGHT - WEIGHT -->
            <center>
                <br>
                <form class="container d-flex justify-content-center dropdown">
                    <b-form-group id="input-group-5" label="Length" label-for="input-5"
                        class="font-weight-bold dropdown1">
                        <b-form-input id="length" v-model="form.length" name="length" placeholder="Length (cm)" required type="number">
                        </b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-6" label="Width" label-for="input-6"
                        class="font-weight-bold dropdown1">
                        <b-form-input id="width" v-model="form.width" name="width" placeholder="Width (cm)" required type="number">
                        </b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-7" label="Height" label-for="input-7" 
                        class="font-weight-bold dropdown1">
                        <b-form-input id="height" v-model="form.height" name="height" placeholder="Height (cm)" required type="number">
                        </b-form-input>
                    </b-form-group>

                    <b-form-group id="input-group-8" label="Weight" label-for="input-8"
                        class="font-weight-bold dropdown1">
                        <b-form-input id="weight" v-model="form.weight" name="weight" placeholder="Weight (kg)" required type="number">
                        </b-form-input>
                    </b-form-group>
                </form>
                <!-- LENGTH - WIDTH - HEIGHT - WEIGHT -- END CODE -->
            </center>
                 <!-- Add another package -->
                 <center>
                    <br>
                    <br>
                <p>
                 <a> <i class="fa-solid fa-circle-plus"></i> </a> Add another package
                </p>
                </center>
                <center>
                    <br>
                <form class="container d-flex justify-content-center dropdown"> 
            <div class="col-md-5">
        
       <div class="container p-3" style="border: 2px solid #0D7CFF"><br>
         <label for="file"><b-icon class="icona" icon="plus-circle" scale="2"></b-icon></label><br>
         <input type="file" id="file" style="display:none;"><br>
         <p class="par1">Take a Photo<br>Upload Image</p>  
         </div>
         </div>
         </form>
         </center>
        <br>
    
    </div>
    <div class="container-fluid contact">
        <h3 style="text-align:left; padding-bottom:.3rem;padding-top:.3rem;">Delivery Schedule</h3>
    </div>
    <div class="container-fluid sender">
        <!-- SET SCHEDULE -->
        <center>
        <form class="container d-flex justify-content-center dropdown"> 
                <div class="container sched">
                    <b-form-group id="input-group-6" v-slot="{ ariaDescribedby }">
                        <b-form-checkbox-group v-model="form.checked" id="checkboxes-4"
                            :aria-describedby="ariaDescribedby">
                    <div class="row">

                        <div class="col sched1">
                            <br><br>
                            <h1><i class="fa-solid fa-bell"></i></h1>
                                Quick<br><br>
                            <pre><b-form-checkbox value="Earliest pickup within an hour"> ASAP - within 1 hour or less</b-form-checkbox></pre><br>
                        </div>

                        <div class="col sched1">
                            <br><br>
                            <h1><i class="fa-solid fa-calendar-days"></i></h1>
                                Schedule<br><br>
                                <pre><b-form-checkbox value="Set preferred date and time of delivery"> Set preferred date and time of delivery</b-form-checkbox></pre><br>
                        </div>
                    </div>
                    </b-form-checkbox-group>
                    </b-form-group>
                    
                </div>
                </form>
                </center>
    </div>
    <!-- Other Details -->
    <div class="container-fluid contact" >
        <h3 style="text-align:left; padding-bottom:.3rem;padding-top:.3rem;">Services</h3>
    </div>
     <div class="container-fluid sender">
        <div>
        <span id="user">Standard Service</span> &nbsp;&nbsp;<i class="fa-solid fa-circle-info" style="color:#FBCD10;"></i>
        <input class="form-check-input" type="checkbox" v-model="form.checked" id="checkboxNoLabel" value="" aria-label="..."  style="color:#003060; float: right;"/>
        <div><span id="user">--</span></div>
  
      </div>
    </div>
    <div class="container-fluid sender">
        <div>
       <span id="user">Special Assistance</span> &nbsp;&nbsp;<i class="fa-solid fa-circle-info" style="color:#FBCD10;"></i>
        
        <input class="form-check-input" type="checkbox" v-model="form.checked" id="checkboxNoLabel" value="" aria-label="..."  style="color:#003060; float: right;"/>
        <div><span id="user" >--</span></div>
      </div>
    </div>
    <div class="container-fluid sender">
        <div>
        <span id="user">Customer Service</span> &nbsp;&nbsp;<i class="fa-solid fa-circle-info" style="color:#FBCD10;"></i>
        <input class="form-check-input" type="checkbox" v-model="form.checked" id="checkboxNoLabel" value="" aria-label="..."  style="color:#003060; float: right;"/>
        <div><span id="user">--</span></div>
      </div>
    </div>
    <div class="container-fluid sender">
        <div>
        <span id="user">Tarpaulin Cover</span> &nbsp;&nbsp;<i class="fa-solid fa-circle-info" style="color:#FBCD10;"></i>
        <input class="form-check-input" type="checkbox" v-model="form.checked" id="checkboxNoLabel" value="" aria-label="..."  style="color:#003060; float: right;"/>
        <div><span id="user" style="color:#003060">P50</span></div>
      </div>
    </div>
<!--For mode of payment-->
    <div class="container-fluid contact">
        <h3 style="padding-bottom:.3rem;padding-top:.3rem;">Mode of Payment</h3>
    </div>
     <div class="container-fluid sender">
       <form class="container d-flex">
      <v-app class="form" style="width:45rem;float:center;">
                          <v-select
                          v-model="form.mode_payment"
                          label="Choose Mode of Payment"
                          class="select d-flex"
                          background-color="#eef5fd"
                          :items="modes"
                          item-text="ModePay"
                          solo
                          rounded
                          >
      </v-select>
                          </v-app>
                          <br><br>
                          </form>
        </div>
      <!--Remarks-->
    <div class="container-fluid contact">
        <h3 style="padding-bottom:.3rem;padding-top:.3rem;">Remarks</h3>
    </div>
      <div class="container-fluid sender">
        <b-form-input id="remarks" class="textarea" v-model="form.remarks" name="remarks"  placeholder="Additional information or instruction for you delivery.." ></b-form-input>     
        </div>
        <br>

    <form class="container d-flex justify-content-center dropdown">
        <center>  
        <b-button id=btn-custom @click="showModal">Place Order</b-button>
        </center>
    </form>
   
    <div class="Modal">
    
     <b-modal ref="my-modal" hide-footer title="BOOKING DETAILS">
      
      
      <!-- <div class="Adding"
            v-for="showdetails in showdetails"
            v-bind:key="showdetails.id"> -->
    
       <div class="d-block"> 
        <!--ADDRESS-->
        <br>
        <div class="container-fluid pick-upadd" style="margin-left:2ch;">
          <i class="far fa-circle" style="color:#FBCD10; text-align:left;"></i>
          &nbsp;&nbsp;<span id="usera">{{form.sender_loc}}</span>
          <p>
            {{form.sender_name}} | {{form.sender_num}}
          </p>
        </div>
        <div class="container-fluid drop-offadd" style="margin-left:2ch;">
          <i class="far fa-circle" style="color:#FBCD10; text-align:left;"></i>
          &nbsp;&nbsp;<span id="usera">{{form.recipient_loc}}</span>
          <p>
          {{form.recipient_name}} | {{form.recipient_num}}
          </p>
        </div>

        <!--PACKAGE DETAILS-->
        <div class="container-fluid package-details" style="margin-left:5ch;">
          <br>
          <div class="row">
            <div class="col-1 text-left" style="color: black; height: 4px;">
              <br><img src="" width="70" height="50" alt="PACKAGE PIC">
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ; margin-left: 12ch;">length</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black;">Cargo type</span>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ; font-weight:bold; margin-left: 12ch;">{{form.length}}x{{form.width}}x{{form.height}}cm</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black; font-weight:bold;">{{form.cargo_type}}</span> <br><br>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ;margin-left: 12ch;">Weight</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black;"> Vehicle Type</span>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ; font-weight:bold; margin-left: 12ch;"> {{form.weight}} kg </span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black; font-weight:bold;"> {{form.vehicle_type}} </span> <br><br>
            </div>
          </div>
        </div>

        <!--DISTANCE-->
        <div class="container-fluid distance">
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 25px;">
              <span style="color:black ; font-weight:bold; margin-left: 1ch;">Distance </span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black; font-weight:bold;"> {{form.distance}} km </span>
            </div>
          </div>
        </div>

        <!--REMARKS-->
        <div class="container-fluid Remarks" style="margin-left: 1ch;">
          <p>
            <span style="color:black ; font-weight:bold;">Remarks</span>
            <br>
            {{form.remarks}}
          </p>
        </div>

        <!--PRICE & MOP-->
        <div class="container-fluid Price-MOP">
          <div class="row">
            <div class="col-6 text-left" style="color: black;">
              <span style="color:black ; font-weight:bold; margin-left: 1ch;">Price</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:#003060; font-weight:bold;"> P{{form.price}} </span>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black;">
              <span style="color:black ; font-weight:bold; margin-left: 1ch;">Mode of Payment </span>
            </div>
            <div class="col-6 text-center">
              <span style="color:#003060; font-weight:bold;"> {{form.mode_payment}} </span>
            </div>
          </div>
        </div>
      </div>
      <br>
       <pre
                        class="text-center">  <b-button pill href="/toship" variant="primary font-weight-bold" style="font-family:'Poppins', 'sans-serif'">   BOOK NOW   </b-button></pre>
      
     
      <!-- </div> -->
    </b-modal>
  </div>
    
  </div>
</template>


<script>
import axios from 'axios'
  export default {
    Name: "RoutePanel",
    
     data: () => ({
        form: {
                data:'',
                sender_loc:"",
                sender_name:"",
                sender_num:"",
                recipient_loc:"",
                recipient_name:"",
                recipient_num:"",
                length: "",
                width: "",
                height: "",
                weight: "",
                remarks:"",
                cargo_type: '',
                vehicle_type: '',
                mode_payment: '',
                
        },
        vehicles: [],
        cargos: [],
        modes:[],
        show: true
    }),

    mounted() {
        this.displayList()
    }, 

    methods: {
       
      async displayList(){
            await axios.get('/optionlist').then((res)=>{
                console.log(res)
                this.vehicles = res.data.Vehicles
                this.cargos = res.data.CargoType
                this.modes = res.data.ModePay
            })
        },

        showModal() {
      this.$refs['my-modal'].show()
      axios.post('/booking',this.form).then((response)=>{
                 console.log(response)
                 this.data=response
            }).catch((err)=>{
                console.log(err)
            })
    },
    hideModal() {
      this.$refs['my-modal'].hide()
    },
    showdetails(){
      //do not delete this.
      /*   axios.get('/getbook').then((response)=>{
          
            this.details = response.data[0]

           // console.log(this.details)
             }).catch((errors)=>{
    
             })  */
            

            let id = localStorage.getItem('details');
         
              axios.get("/getbooking/"+id).then((response)=>{
                    console.log(response.data)
                    this.showdetails = response
                    console.log(this.showdetails)
               }).catch((errors)=>{
                    console.log(err)    
             }) 
    },

    details(){

            },
        },    
    }
</script>


<style scoped>

.booking{
    padding-bottom: 50px;
    padding-top: 50px;
}

.Price-MOP{
  background-color: lightgray;
}

.location{
    background-color: #003060;
    padding: 3rem;
    color: #ffffff;
    padding-left: 1rem;
    width: 50rem;
    height:20rem;
    border-radius: 3rem;
    box-shadow: 2px 10px 10px 2px rgba(0, 0, 0, 0.4);
}
.contact{
    background-color: #003060;
    padding: .4rem;
    color: white;
    padding-left: 2rem;
    width: 50rem;  
}
.sender{
    background-color: #ffffff;
    padding: 1rem;
    color: white;
    padding-left: 2rem;
    width: 50rem;
    border: 2px solid grey;
    border-bottom: 1.5px solid black;
}
.loc {
    color: #FBCD10;
}
#userone{
  font-family: 'Poppins','sans-serif';
  font-size: 1rem;
  color: black;

}
.form {
  font-family:Roboto;
  height: 5px;
  max-width:900px;
  text-align:left;
}
.titletwo{
    background-color: white;
    height: 100px;
    font-weight:bold;
    color: #003060;
    font-size: 20px;
}
.dropdown .dropdown1{
    font-weight:bold;
    color: #003060;
    width: 18rem;
    font-size: 20px;
}

.icona{
    cursor:pointer; 
    color: #0D7CFF;
}
.icona:hover{
    cursor:pointer; 
    color: #FFC000;
}
.par1{
    color:grey;
    font-size:16px;
    font-family: 'Arial';
   text-align:center;
}
p{
    color: #003060;
    font-family: 'Poppins','sans-serif';
    font-size: 18px;
}
.sched .sched1{
    background-color: white;
    color: #003060;
    align-items: center;
    width: 50%;
}
h1{
    font-size: 5rem;
}
#user{
  font-family: 'Poppins','sans-serif';
  font-size: 1.1rem;
  color: black;
  text-align:left;
}

#input{
    border-radius:5rem;
}
.input-group-text{
border-top-left-radius:5rem; 
border-bottom-left-radius: 5rem;
}
#num{
 border-top-right-radius:5rem; 
border-bottom-right-radius: 5rem; 
}
textarea {
  width: 100%;
  height: 50px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px gray;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  color: gray;
}
#usera {
  font-family: 'Poppins', 'sans-serif';
  font-size: 1rem;
  color: rgb(49, 48, 48);
  text-align: left;
}
.distance {
  background-color: lightgray;
}
#btn-custom{
    width: 10rem;
    background: #FBCD10;
    color: white;
    font-family: 'Poppins','sans-serif';
    font-size: 20px;
    box-shadow: 0px 2px 2px 1px #aaa;
    border:none;
    border-radius:3rem;
}
#btn-custom:hover{
    background: #ffae00;
    color: rgb(255, 255, 255);
}
@media (max-width:800px) {
.location{
    width: 40rem;
}
.contact{
    width: 34rem;  
}
.sender{
    width: 34rem;
}
}
@media (max-width:700px) {
.location{
    width: 25rem;
}
.contact{
    width: 25rem;  
}
.sender{
    width: 25rem;
}
}
@media (max-width:500px) {
.location{
    width: 20rem;
}
.contact{
    width: 20rem;  
}
.sender{
    width: 20rem;
}
}
@media (max-width:350px) {
.location{
    width: 18rem;
}
.contact{
    width: 18rem;  
}
.sender{
    width: 18rem;
}
#userone{
  font-size: .9rem;
}
}



</style>

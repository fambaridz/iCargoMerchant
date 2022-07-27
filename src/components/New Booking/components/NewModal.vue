<template>
  <div class="Modal">
    <center>  
    <b-button id=btn-custom @click="showModal">Place Order</b-button>
    </center>
     <b-modal ref="my-modal" hide-footer title="BOOKING DETAILS">
      
      
      <div class="Adding"
            v-for="showdetails in showdetails"
            v-bind:key="showdetails.id">
        <form>
      <div class="d-block">
        <!--ADDRESS-->
        <br>
        <div class="container-fluid pick-upadd" style="margin-left:2ch;">
          <i class="far fa-circle" style="color:#FBCD10; text-align:left;"></i>
          &nbsp;&nbsp;<span id="usera">{{showdetails.sender_location}}</span>
          <p>
            {{showdetails.sender_name}} | {{showdetails.sender_contact}}
          </p>
        </div>
        <div class="container-fluid drop-offadd" style="margin-left:2ch;">
          <i class="far fa-circle" style="color:#FBCD10; text-align:left;"></i>
          &nbsp;&nbsp;<span id="usera">{{showdetails.recipient_location}}</span>
          <br>
          {{showdetails.recipient_name}} | {{showdetails.recipient_contact}}
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
              <span style="color:black ; margin-left: 12ch;">Dimension</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black;">Cargo type</span>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ; font-weight:bold; margin-left: 12ch;">{{showdetails.dimention}}cm</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black; font-weight:bold;">{{showdetails.cargo_type}}</span> <br><br>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ;margin-left: 12ch;">Weight</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black;"> Cargo Service</span>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black; height: 22px;">
              <span style="color:black ; font-weight:bold; margin-left: 12ch;"> {{showdetails.weight}} kg </span>
            </div>
            <div class="col-6 text-center">
              <span style="color:black; font-weight:bold;"> {{showdetails.cargo_service}} </span> <br><br>
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
              <span style="color:black; font-weight:bold;"> {{showdetails.distance}} km </span>
            </div>
          </div>
        </div>

        <!--REMARKS-->
        <div class="container-fluid Remarks" style="margin-left: 1ch;">
          <p>
            <span style="color:black ; font-weight:bold;">Remarks</span>
            <br>
            {{showdetails.remarks}}
          </p>
        </div>

        <!--PRICE & MOP-->
        <div class="container-fluid Price-MOP">
          <div class="row">
            <div class="col-6 text-left" style="color: black;">
              <span style="color:black ; font-weight:bold; margin-left: 1ch;">Price</span>
            </div>
            <div class="col-6 text-center">
              <span style="color:#003060; font-weight:bold;"> P{{showdetails.price}} </span>
            </div>
          </div>
          <div class="row">
            <div class="col-6 text-left" style="color: black;">
              <span style="color:black ; font-weight:bold; margin-left: 1ch;">Mode of Payment </span>
            </div>
            <div class="col-6 text-center">
              <span style="color:#003060; font-weight:bold;"> {{showdetails.mode_of_payment}} </span>
            </div>
          </div>
        </div>
      </div>
      <br>
       <pre
                        class="text-center">  <b-button pill href="/toship" variant="primary font-weight-bold" style="font-family:'Poppins', 'sans-serif'" >   BOOK NOW   </b-button></pre>
      
      </form>
      </div>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'
export default {
    data(){
        return {
          details : {},

          showdetails: [
                {
              
                    sender_location: '20 Tabang, Guiguinto, Bulacan 3015',
                    sender_name: 'Dianna Mateo',
                    sender_contact: '09999999999',
                    recipient_location: '20 Tabang, Guiguinto, Bulacan 3015',
                    recipient_name: 'Joyce Balala',
                    recipient_contact: '09999999999',
                    package_picture: '',
                    dimention: '34x54x22',
                    cargo_type: 'Crate',
                    cargo_service: 'Truck',
                    weight: '10',
                    distance: '125',
                    remarks: 'None',
                    price: '50',
                    mode_of_payment: 'GCASH',
                },
               
            ]
        }
    },
  mounted(){
   // this.showdetails()
  },
  methods: {
    showModal() {
      this.$refs['my-modal'].show()
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
  } 
}
</script>
<style scoped>
.datetime {
  background-color: #003060;
  width: 28rem;
  align-items: flex-start;
  height: 3em;
}

#usera {
  font-family: 'Poppins', 'sans-serif';
  font-size: 1rem;
  color: rgb(49, 48, 48);
  text-align: left;
}

.Price-MOP {
  background-color: lightgray;
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



@media (max-width:700px) {
  .datetime {
    width: 22rem;
  }

  #show-btn {
    margin-left: 16ch;
  }
}
</style>

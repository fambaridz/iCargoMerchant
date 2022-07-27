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
                                <b-form-input id="input" v-model="form.senderloc"
                                    name="senderloc" placeholder="Sender's Location" required></b-form-input>
                            </b-form-group>
                            <br><br>
                            <b-form-group id="input-group-2" label-for="input-2" class="font-weight-bold text-primary inputloc">
                                <b-form-input id="input" v-model="form.recipientloc"
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
  <input type="number"  class="form-control" id="num" v-model="form.sender_number" name="sender_number">
</div>
        <br>
        <!--Recipients Location-->
        <h4 style="color:black; text-align:left;">Recipient</h4>
      <b-form-input id="input" v-model="form.recipient_name" name="recipient_name" placeholder="Recipient's Name" ></b-form-input>

    <br><div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">+63</span>
  </div>
  <input type="number" class="form-control" id="num" v-model="form.recipient_number" name="recipient_number">
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
                    v-model="form.vehicles"
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
                    v-model="form.cargos"
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
       <select id="state" class="form-select">
         <option selected><b>Cash on Delivery</b></option>
         <option><b>GCASH</b></option>
         <option><b>Bank</b></option>
        </select> 
        </div>
      <!--Remarks-->
    <div class="container-fluid contact">
        <h3 style="padding-bottom:.3rem;padding-top:.3rem;">Remarks</h3>
    </div>
      <div class="container-fluid sender">
        <b-form-input id="remarks" class="textarea" v-model="form.remarks" name="remarks"  placeholder="Additional information or instruction for you delivery.." ></b-form-input>

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
                senderloc:"",
                recipientloc:"",
                length: "",
                width: "",
                height: "",
                weight: "",
                cargotype: null,
                vehicletype: null,
                checked: "",
        },
        vehicles: [],
        cargos: [],
        show: true
    }),

    mounted() {
        this.displayList()
    }, 

    methods: {
        },

        async displayList(){
            await axios.get('/optionlist').then((res)=>{
                console.log(res)
                this.vehicles = res.data.Vehicles
                this.cargos = res.data.CargoType
            })
        },
        
       
    }
</script>


<style scoped>

.booking{
    padding-bottom: 50px;
    padding-top: 50px;
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
#state{
    width:45rem;
    border-color:white;
    font-family: 'Poppins','sans-serif';

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
  resize: none;
}


</style>

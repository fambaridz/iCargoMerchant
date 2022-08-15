<template>
  <div >
   <div class="Adding"
            v-for="showdetails in showdetails"
            v-bind:key="showdetails.id">
        <form>
      

    <div class="GMAP">
      <br>
      <GmapMap :center='center' :zoom='12' style='width:100%;  height: 200px;'>
        <GmapMarker :key="index" v-for="(m, index) in markers" :position="m.position" @click="center = m.position" />
      </GmapMap>
    </div>
    <!---CONTENT-->
    <div class="MapLayer">
      <div class="container-fluid Details">

        <!--SENDER-->
        <div class="container-fluid Sender">
          <br>
          <div row>
            <span class="sender">Sender:</span>
            <span class="name"> {{showdetails.sender_name}}</span>
          </div>
        </div>


        <!--RECIPIENT-->
        <div class="container-fluid Recipient">
          <div row>
            <span class="recipient">Recipient:</span>
            <span class="name"> {{showdetails.recipient_name}} </span>
            <br> <br>
          </div>
        </div>

        <!--PICK-UP ADDRESS-->
        <div class="container-fluid PUAdd">
          <div row>
            <i class="fa-solid fa-box box"></i>
            <span class="address">{{showdetails.sender_location}} </span>
            <br><br>
          </div>
        </div>


        <!--VERTICAL LINE-->
        <div class="container-fluid VLine">
          <div class="container-fluid vertical-line"></div>
        </div>


        <!--DRIVER DETAILS-->
        <div class="container-fluid Driver-Details">
          <h6 class="h6">Your Driver</h6>
          <i class="fa-regular fa-circle-user user-icon"></i>
          <span id="driver-name">{{showdetails.driver_name}} </span>
          <i class="fa-solid fa-square-phone phone-icon"></i>
          <br>
          <span id="logistic-company">&nbsp;&nbsp;&nbsp;AllGoods Logistic Co.</span>
          <br>
        </div>

        <!--DROP-OFF ADDRESS-->
        <div class="DOAdd">
          <div row>
            <br>
            <i class="fa-solid fa-box boxa"></i>
            <span class="address2 justified">{{showdetails.recipient_location}} </span>
          </div>
        </div>

      </div>
    </div>
    </form>
    </div>
  </div>
</template>

<script>

import axios from "axios";


export default {
  name: 'GoogleMap',
  data(){
        return {
            center: { lat: 45.508, lng: -73.587 },
            currentPlace: null,
            markers: [],
            places: [],
            details : {},

          showdetails: [
                {
                   
                    driver_name: 'Juan Dela Cruz',
                    sender_location: '20 Tabang, Guiguinto, Bulacan 3015',
                    sender_name: 'Dianna Mateo',
                    sender_contact: '09999999999',
                    recipient_location: '20 Tabang, Guiguinto, Bulacan 3015',
                    recipient_name: 'Joyce Balala',
                   
                   
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

};

</script>

<style scoped>
.Details {
  background-color: #003060;
  color: white;
  width: 100%;
  height: 160em;
}

.Driver-Details {
  background-color: white;
  width: 25em;
  height: 5.7em;
  color: black;
  border-radius: 20px;
  background-color: white;
  margin-left: 53ch;

}

#driver-name {
  margin-left: 12ch;
  font-weight: bold;
}

#logistic-company {
  margin-left: 12ch;
}

.user-icon {
  position: absolute;
  width: 3rem;
  height: 3rem;
  color: #0D7CFF;
  margin-left: 2ch;
}

.phone-icon {
  position: absolute;
  width: 2.875rem;
  height: 2.875rem;
  color: #e7ba09;
  margin-left: 4ch
}

.Sender {
  margin-left: 50ch;
}

.sender {
  color: white;
  font-weight: bold;
}

.name {
  color: white;
  margin-left: 2ch;
}

.Recipient {
  margin-left: 50ch;
}

.recipient {
  color: white;
  font-weight: bold;
}

.box {
  position: absolute;
  color: #fbcd10;
  margin-left: 0ch;
  width: 2rem;
  height: 2rem;
}

.boxa {
  position: absolute;
  color: white;
  margin-left: 3ch;
  width: 2rem;
  height: 2rem;
}

.VLine {
  margin-left: 31.5ch;
}

.vertical-line {
  position: absolute;
  background-color: white;
  padding: .000001rem;
  width: .400%;
  height: 6rem;
  margin-left: 10ch;
}

.PUAdd {
  margin-left: 40ch;
}

.DOAdd {
  margin-left: 40ch;
}

.address {
  color: white;
  margin-left: 10ch;
}

.address2 {
  color: white;
  margin-left: 13.9ch;
}

@media (max-width:700px) {

  .GMAP{
    width: 100%;
  }
  .Details {
    width: 100%;
    height: 40rem;
  }

  .Driver-Details {
    width: 20rem;
    margin-left: 2ch;
  }

  .h6 {
    margin-left: 10ch;
  }
  
  #driver-name{
    margin-left:6ch;
  }

  #logistic-company {
    margin-left: 5ch;
  }

  .user-icon {
    margin-left: -1ch;
  }

  .phone-icon {
    margin-left: 2ch;
  }

  .Sender {
    width: 25rem;
    margin-left: -3ch;
  }

  .Recipient {
    width: 25rem;
    margin-left: -3ch;
  }

  .PUAdd {
    width: 25rem;
    margin-left: -3ch;
  }

  .DOAdd {
    width: 25rem;
    margin-left: -1ch;
  }

  .address {
    margin-left: 4.9ch;
  }

  .address2 {
    margin-left: 6.8ch;
  }

  .box {
    margin-left: -2.2ch;
  }

  .boxa {
    margin-left: -1.5ch;
  }

  .VLine {
    margin-left: -13.9ch;
  }
}
</style>

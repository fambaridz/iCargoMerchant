<template>
  <div>
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
            <span class="name">Emelio Marasigan W. Araullones</span>
          </div>
        </div>


        <!--RECIPIENT-->
        <div class="container-fluid Recipient">
          <div row>
            <span class="recipient">Recipient:</span>
            <span class="name">Loida Anne Alicia Deline Q. Esteban</span>
            <br> <br>
          </div>
        </div>

        <!--PICK-UP ADDRESS-->
        <div class="container-fluid PUAdd">
          <div row>
            <i class="fa-solid fa-box box"></i>
            <span class="address"> Port Batangas, Batangas Port Access Road, Calatagan, Batangas </span>
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
          <span id="driver-name">Bartholomew D. Sales</span>
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
            <span class="address2 justified">Port Batangas, Batangas Port Access Road, Calatagan, Batangas</span>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'GoogleMap',
  data() {
    return {
      center: { lat: 45.508, lng: -73.587 },
      currentPlace: null,
      markers: [],
      places: [],
    }
  },
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

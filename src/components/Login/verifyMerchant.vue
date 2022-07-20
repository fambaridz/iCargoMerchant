<template>
  <div class="bg container-fluid py-5 p-1">
    <form>
      <div class="row custom-input">
        <div class="col-12">
          <h1 class="text-dark text-center" id="header">Account Verification</h1>
          <v-app class="form">
            <label id="label" class="text-left text-muted required mb-2">
              Proof of Identification
            </label>
            <v-select
              label="Choose Government-issued ID Type"
              class="select d-flex"
              background-color="#eef5fd"
              :items="items"
              item-text="proof_of_identification"
              solo
              rounded
            >
            </v-select>
          </v-app>
        </div>
      </div>

      <div class="row d-flex justify-content-center" id="card">
        <div class="col-lg-6 custom-input">
          <label class="text-left text-muted required my-2">
            Photo of your ID Card
          </label>
          <v-file-input
            background-color="#eef5fd"
            label="Choose File..."
            solo
            rounded
            prepend-icon="mdi-camera"
          ></v-file-input>
        </div>

        <div class="col-lg-6 custom-input" id="permit">
          <label class="text-left text-muted required my-2">
            Business Permit
          </label>
          <v-file-input
            background-color="#eef5fd"
            label="Choose File..."
            solo
            rounded
            prepend-icon="mdi-camera"
          ></v-file-input>
        </div>
      </div>

      <v-row class="container">
        <v-col class="center">
          <input type="checkbox" id="accept" value="accept" />
          <label for="accept" class="check text-dark">
            I have read, understood and accept the <br />
            Terms and Conditions and Privacy Policy.</label
          >
        </v-col>
      </v-row>

      <div class="row custom-input">
        <div class="col-12">
          <p class="text-muted text-center my-4">
            Already have an account?<router-link
              to="SignUp.vue"
              class="text-primary"
            >
              Sign in.</router-link
            >
          </p>
        </div>
      </div>

      <div class="box custom-input">
        <div class="col-12">
          <router-link
            to="/"
            id="button1"
            class="text btn btn-light btn-lg shadow text-muted"
            >Back</router-link>

          <router-link
            to="/registration"
            id="button2"
            class="text btn btn-warning btn-lg shadow text-light"
            >Sign Up</router-link>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: "SignUp",
  data: () => ({
    items: [
   ],
  }),
  mounted(){
    
   this.getID();
  
  },
  methods:{
     async getID(){
      await axios.get('/verification').then((res)=>{
        this.items = res.data.MerchantID
      })
     },
  
    
  },
};
</script>

<style>
.bg {
  height: 150vh;
  position: relative;
  background: linear-gradient(
    to bottom right,
    #280eb8,
    #3352db,
    #4c9cca,
    rgb(79, 135, 187)
  );
}
.form {
  height: 90px;
}
.row {
  margin: 0px 120px;
}
h1 {
  font-weight: bold;
}
p {
  font-size: 1.2em;
}
router-link.text {
  text-decoration: none;
  font-size: 1.4em;
}
#button1 {
  margin: 0 10px;
  display: inline-block;
  padding: 10px 40px;
  border-radius: 20px;
  text-decoration: none;
  font-weight: bold;
}
#button2 {
  margin: 0 auto;
  display: inline-block;
  padding: 10px 40px;
  border-radius: 20px;
  text-decoration: none;
  font-weight: bold;
}
.box{
  text-align: center;
}
.container {
  position: relative;
}
.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
form {
  font-family: Roboto;
  max-width: 900px;
  margin: 150px auto;
  background: white;
  text-align: left;
  padding: 40px 90px;
  border-radius: 50px;
  margin-bottom: 100px;
  flex-wrap: wrap;
}
label {
  color: #aaa;
  display: inline-block;
  margin: 0px;
  font-size: 1em;
  letter-spacing: 1px;
}
.required:after {
  content: " *";
  color: red;
}
input[type="checkbox"] {
  display: none;
}
input[type="checkbox"] + *::before {
  content: "";
  display: inline-block;
  float: left;
  margin-left: -50px;
  margin-top: 5px;
  margin-right: -320px;
  vertical-align: bottom;
  width: 2rem;
  height: 2rem;
  border-style: solid;
  border-width: 0.2rem;
  border-color: yellow;
}
input[type="checkbox"]:checked + *::before {
  content: "✓";
  font-size: 1.2rem;
  font-weight: bolder;
  color: yellow;
  text-align: center;
  background: white;
  border-color: yellow;
}
input[type="checkbox"]:checked + * {
  color: yellow;
}
.check {
  position: inline-block;
  margin-left: 220px;
  text-align: left;
  top: 0;
  left: 0;
}
/* tablet */
@media (max-width: 600px) {
    .bg{
    width:100%;
    height:min-content;
  }
  form{
    width:30rem;
  }
    .form{
    width:18rem;
    margin-left:1ch;
    }
  .row {
    margin: 0px 60px;
  }
  form {
    margin-top: 10px;
  }
  p {
    font-size: 1.2em;
  }
  router-link.text {
    text-decoration: none;
    font-size: 1.4em;
  }
   #button1 {
    padding: 5px 8px;
    border-radius: 20px;
    width:6rem;
    margin-left:-0.7ch;
  }
  #button2 {
    padding: 5px 8px;
    border-radius: 20px;
    width: 8rem;
    margin-left:3ch;
  }
  input[type="checkbox"] {
    display: none;
  }
  input[type="checkbox"] + *::before {
    content: "";
    display: inline-block;
    float: left;
    margin-left: -50px;
    margin-top: 1px;
    margin-right: -310px;
    vertical-align: bottom;
    width: 2rem;
    height: 2rem;
    border-style: solid;
    border-width: 0.2rem;
    border-color: yellow;
  }
  input[type="checkbox"]:checked + *::before {
    content: "✓";
    font-size: 1.2rem;
    font-weight: bolder;
    color: yellow;
    text-align: center;
    background: white;
    border-color: yellow;
  }
  input[type="checkbox"]:checked + * {
    color: yellow;
  }
  .check {
    position: inline-block;
    margin-left: 30px;
    text-align: left;
    font-size: 0.68rem;
    top: 0;
    left: 0;
  }
}
/* big phone */
@media (max-width: 450px) {
  .bg{
    width:100%;
    height:min-content;
  }
  form{
    width:20rem;
  }
    .form{
    width:16rem;
    margin-left:-5ch;
    }
  #card{
    margin-left: -7ch;
    width: 17rem;
  }
  #permit{
    margin-left: 1ch;
    width: 16rem;
  }
  #header{
    margin-left: 0ch;
  }
  .row {
    margin: 0px 30px;
  }
  p {
    font-size: 0.8em;
    padding-top: 40px;
    padding-bottom: -10px;
    margin-left: -2ch;;
  }
  label{
    font-size: 1em;
  }
  router-link.text {
    text-decoration: none;
    font-size: 0.7em;
  }
   #button1 {
    padding: 5px 8px;
    border-radius: 20px;
    width:6rem;
    margin-left:-0.7ch;
  }
  #button2 {
    padding: 5px 8px;
    border-radius: 20px;
    width: 8rem;
    margin-left:-1ch;
    margin-top: 2ch;
  }
  input[type="checkbox"] {
    display: none;
  }
  input[type="checkbox"] + *::before {
    content: "";
    display: inline-block;
    float: left;
    margin-left: -50px;
    margin-top: 20px;
    margin-right: -310px;
    vertical-align: bottom;
    width: 1.5rem;
    height: 1.5rem;
    border-style: solid;
    border-width: 0.2rem;
    border-color: yellow;
  }
  input[type="checkbox"]:checked + *::before {
    content: "✓";
    font-size: 1rem;
    font-weight: bolder;
    color: yellow;
    text-align: center;
    background: white;
    border-color: yellow;
  }
  input[type="checkbox"]:checked + * {
    color: yellow;
  }
  .check {
    position: inline-block;
    margin-left: 10px;
    width: 160px;
    margin-top: 100px;
    margin-bottom: 70px;
    text-align: left;
    font-size: 0.7rem;
  }
}
/* small phone */
@media (max-width: 379px) {
  .bg{
    width:100%;
    height:min-content;
  }
  form{
    width:18rem;
  }
    .form{
    width:15rem;
    margin-left:-7ch;   
  }
  .row {
    width:12rem;
  }
  #card{
    margin-left: -7ch;
    width: 15rem;
  }
  #permit{
    margin-left: 1ch;
  }
  #header{
    margin-left: -3ch;
  }
  p {
    font-size: 0.7em;
    margin-left:-6ch;
  }
  label{
    font-size: 0.9em;
  }
  router-link.text {
    text-decoration: none;
    font-size: 0.7em;
  }
  #button1 {
    padding: 5px 8px;
    border-radius: 20px;
    width:6rem;
    margin-left:-0.7ch;
  }
  #button2 {
    padding: 5px 8px;
    border-radius: 20px;
    width: 10rem;
    margin-left:-3ch;
    margin-top: 2ch;
  }
  input[type="checkbox"] {
    display: none;
  }
  input[type="checkbox"] + *::before {
    content: "";
    display: inline-block;
    float: left;
    margin-left: -60px;
    margin-top: 20px;
    margin-right: -310px;
    vertical-align: bottom;
    width: 1.5rem;
    height: 1.5rem;
    border-style: solid;
    border-width: 0.2rem;
    border-color: yellow;
  }
  input[type="checkbox"]:checked + *::before {
    content: "✓";
    font-size: 0.8rem;
    font-weight: bolder;
    color: yellow;
    text-align: center;
    background: white;
    border-color: yellow;
  }
  input[type="checkbox"]:checked + * {
    color: yellow;
  }
  .check {
    position: inline-block;
    width: 90px;
    margin-left: 40px;
    margin-top: 120px;
    margin-bottom: 70px;
    text-align: left;
    font-size: 0.7rem;
  }
}
</style>

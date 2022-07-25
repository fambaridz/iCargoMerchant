<template>
    <div class="ongoing-body">
        <nav>
            <NavbarTop />
            <TitleHeader />
        </nav>
        <div>
            <b-tabs justified>
                <div class="topnav">
                    <a href="/toship" class="disable"><b id="top-nav">To ship</b></a>
                    <a class="active"><b id="top-nav" style="color:white">On going</b></a>
                    <a href="/complete" class="disable"><b id="top-nav">Completed</b></a>
                    <a href="/cancel" class="disable"><b id="top-nav">Cancelled</b></a>
                </div>
            </b-tabs>
        </div>

        <div class="Adding"
            v-for="getbook in getbook"
            v-bind:key="getbook.id">
        <form>

        <b-container class="ongoing">
            <b-nav>
            <!--ORDER-->
            <br>
            <b-row>
                <div class="container-fluid box-header">
                    
                        <div class="col-6 text-left" style="height: 1px;">
                            <h3 id="date-time">{{getbook.date}} {{getbook.time}}</h3>
                        </div>
                        <div class="row">
                        <div class="col-15 text-left" style="margin-left:2ch;">
                                <b-row>
                                    <ModalOngoing />  
                                </b-row>
                        </div>
                    </div>
                </div>
                <div class="container-fluid address">
                    <i class="fa-regular fa-circle" style="color:#FBCD10; margin-left: 3ch;"></i>
                    &nbsp;&nbsp;&nbsp;&nbsp;<span id="pu-address">{{getbook.recipient_location}}</span>
                    <br>
                    <br>
                    <i class="fa-solid fa-location-dot" style="color:#FBCD10; margin-left: 3ch;"></i>
                    &nbsp;&nbsp;&nbsp;&nbsp;<span id="do-address">{{getbook.sender_location}}</span>
                </div>

                <div class="container-fluid box-footer">
                    <div class="row">
                        <div class="col-6 text-left" style="color: black; height: 20px;">
                            <span id="vehicle-type">{{getbook.vehicle}}</span>
                        </div>
                        <div class="col-6 text-center">
                            <span id="price">P {{getbook.price}}</span>
                        </div>
                    </div>
                </div>
            </b-row>
            <br>       
            </b-nav>
        </b-container>
        </form>
        </div>
    </div>
</template>

<script>
import ModalOngoing from './ModalOngoing.vue';
import NavbarTop from '../../../components/Navbar/NavbarTop.vue';
import TitleHeader from './TitleHeader.vue';
import axios from 'axios';


export default {
    name: "OngoingOrder",
    components: { ModalOngoing, NavbarTop, TitleHeader },

    data(){
        return {
         user: '',

         getbook: [
                {
                    date: 'JULY 25, 2022',
                    time: '5:00 PM',
                    recipient_location: '20 Tabang, Guiguinto, Bulacan 3015',
                    sender_location: '20 Tabang, Guiguinto, Bulacan 3015',
                    vehicle: 'Truck',
                    price: '50',
                },
            ]
        }
    },

    mounted(){
    
          //this.book()
    },

    methods: {
        book(){

        },

     
        
        getbook(){
             
             let id = localStorage.getItem('book');
         

              axios.get("/getbooking/"+id).then((response)=>{
                    console.log(response.data)
                    this.getbook = response
                    console.log(this.getbook)

            //please do use an array to loop it in the template table row

               }).catch((errors)=>{
                    console.log(err)
   
    
             })  
        }
    }
}


</script>

<style scoped>

.toship-body {
    height: 100%;
    background-color: white;
}

.box-header {
    background-color: #003060;
    padding: 1rem;
    color: white;
    padding-left: 3rem;
    width: 50rem;
}

.address {
    background-color: #ffffff;
    padding: 1rem;
    color: rgb(8, 8, 8);
    padding-left: 2rem;
    width: 50rem;
    border: 1px solid rgb(156, 151, 151);
}

.box-footer {
    background-color: rgb(224, 224, 238);
    padding: 0rem;
    color: rgb(8, 8, 8);
    padding-left: 1rem;
    width: 50rem;
    border: 1px solid rgb(156, 151, 151);
    text-align: left;
}


#date-time {
    color: white;
    margin-left: 1ch;
    font-size: x-large;
}

#vehicle-type {
    color: black;
    font-weight: bold;
    margin-left: 10ch;
}

#price {
    color: navy;
    font-weight: bold;
}

#cancel {
    background-color: #FBCD10;
    color: black;
    font-family: 'Poppins', 'sans-serif';
    font-size: 1em;
    padding: .5em;
    padding-left: 1rem;
    padding-right: 1rem;
    border: none;
    border-radius: 4rem;
    margin-left: 50ch;
}

.topnav {
    overflow: hidden;
    background-color: white;
    align-self: center;
    margin-top: -8px;
}

.topnav a {
    width: 25%;
    float: left;
    font-family: Arial;
    color: black;
    text-align: center;
    padding: 10px;
    text-decoration: none;
    font-size: 17px;
}

.topnav a.active {
    border: 1px solid grey;
    color: solid white;
    background-color: #1267bd;
}

.topnav a.disable {
    border: 1px solid grey;
    color: solid white;
}

a.disable:hover {
    background-color: #FBCD10;
}

@media (max-width:700px) {
    /* .topnav{
        width: 25em;
    } */

    .box-header {
        width: 22rem;
    }

    #date-time {
    margin-left: -1ch;
    font-size: 18px;
    }

    .address {
        width: 22rem;
    }

    .box-footer {
        width: 22rem;
    }

    #cancel {
        margin-left: 14ch;
        width: 9rem;
    }
}

@media (max-width:350px) {

    .toship {
        width: fit-content;
    }

    .topnav {
        width: 19em;
    }

    .topnav a {
        width: 25%;
    }

    .box-header {
        width: 17rem;
    }

    .address {
        width: 17rem;
    }

    #date-time {
    margin-left: -1ch;
    font-size: 18px;
    }

    .box-footer {
        width: 17rem;
    }

    #cancel {
        margin-left: 9.5ch;
        width: 7rem;
    }
}

/* for top nav */
@media(max-width:400px){
    #top-nav{
      font-size: 0.8rem;
    }
}
@media(max-width:350px){
    #top-nav{
      font-size: 0.5rem;
    }
}
</style>

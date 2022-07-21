<template>

    <div id="BodyUser">
        <!-- profile -->
        
        <!-- display if image cannot be found -->
        <span style="font-weight:bold; color: red;">{{userWithIcon.msg}}</span>
        <!--  -->

        <div v-if="image.profile_image !== null">
        <a href="#" v-b-modal.modal-custom-picture><img :src="userWithIcon.icon" class="fa-circle-user" alt="company profile"></a>
        </div>
        
        <div v-else-if="image.profile_image == null">
        <a href="#" v-b-modal.modal-custom-picture><i class="fa-solid fa-circle-user"></i></a>
        </div>

        <div class="row text-center">
            <div class="col-lg-12 d-flex justify-content-center align-items-center profile">
                <span id="comp-name">{{info.business_name}}</span>
                <input type="file" id="file" style="display:none;">
                <a href="#" v-b-modal.modal-custom-name><i class="fa-solid fa-pen-to-square"></i></a>
            </div>
        </div>
        <!-- profile end -->
        <div>
            <NameModal/>
            <ChangePic/>
        </div>
    </div>

</template>

<script>
import NameModal from './NameModal.vue';
import ChangePic from './ChangePic.vue'
import axios from 'axios';


export default {
    name: 'BodyUser',
     components:{
    NameModal,
    ChangePic,
    ChangePic
},
     data(){
        return{
            info:{
                business_name:'',
                profile_image: ''
            },
            image:{
            }
        }
     },
    computed: {
        userWithIcon() {
            try {
                return {
                ...this.image,
                icon: this.image.profile_image && require(`../../assets/profile/${this.image.profile_image}`)
                }
            } catch (error) {
                return {
                    msg:"image cannot be found"
                }
            }

            // return {
            //     ...this.image,
            //     icon: this.image.profile_image && require(`../../assets/profile/${this.image.profile_image}`)
            // }
        }
    },
    mounted() {
        this.getName()
    },
    methods: {

    async getName(){

        await axios.get("/user").then((response) => {
             
                  this.info = response.data
                  this.image = response.data
                  console.log(this.info)
                   
          });
      },
    }
     

}
</script>

<style scoped>
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css");

.fa-circle-user {
    width: 275px;
    height: 275px;
    color: #0D7CFF;
    margin-bottom: 10px;
    border-radius: 50%;
}
#profile-pic{
    cursor: pointer;
}
.fa-circle-user:hover{
    opacity: 0.71;
    cursor: pointer;
}

#comp-name {
    font-family: 'Poppins', 'sans-serif';
    font-size: 1.3rem;
}

.profile {
    column-gap: 15px;
}

.fa-pen-to-square {
    font-size: 30px;
    color: #FFC000;
}
.fa-pen-to-square:hover{
    color: #0D7CFF;
}
@media (max-width:1200px) {
    .fa-circle-user {
        width: 225px;
        height: 225px;
    }
}
@media (max-width:800px) {
    .fa-circle-user {
        width: 200px;
        height: 200px;
    }
}

@media (max-width:550px) {
    #comp-name {
        font-family: 'Poppins', 'sans-serif';
        font-size: 1rem;
    }
}

@media (max-width:500px) {
    #comp-name {
        font-family: 'Poppins', 'sans-serif';
        font-size: 1rem;
    }
}

@media (max-width:500px) {
    #comp-name {
        font-family: 'Poppins', 'sans-serif';
        font-size: 1rem;
    }

    .fa-circle-user {
        width: 175px;
        height: 175px;
    }

    .bi-camera {
        font-size: 30px;
    }

    .profile {
        display: block;
    }

}

@media(max-width:350px) {
    .fa-circle-user {
        width: 150px;
        height: 150px;
    }
}
</style>
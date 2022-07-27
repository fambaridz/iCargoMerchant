<template>
    <div>
        <!-- box 1 -->
        <div class="row box">
            <div class="col-2 d-flex justify-content-center align-items-center">
                <i id="icon" class="bi bi-person icon"></i>
            </div>
            <div class="col-8 d-flex align-items-center box-line">
                <div class="row">
                    <span class="profile-insert">Name</span>
                    <span class="details">{{userInfo.first_name}} {{userInfo.last_name}}</span>
                </div>
            </div>
            <div class="col-2 d-flex justify-content-center align-items-center">
                <a href="#" v-b-modal.modal-custom-1><i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </div>
        <!-- end box 1 -->

        <!-- box 2 -->
        <div class="row box">
            <div class="col-2 d-flex justify-content-center align-items-center">
                <i class="bi bi-info-circle icon"></i>
            </div>
            <div class="col-8 d-flex align-items-center">
                <div class="row about">
                    <span class="profile-insert box-line">About</span>
                    <p id="about">{{userInfo.about}}</p>

                </div>
            </div>
            <div class="col-2 d-flex justify-content-center align-items-center">
                <a href="#" v-b-modal.modal-custom-1><i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </div>
        <!-- end box 2 -->

        <!-- box 3 -->
        <div class="row box">
            <div class="col-2 d-flex justify-content-center align-items-center">
                <i class="bi bi-telephone icon"></i>
            </div>
            <div class="col-8 d-flex align-items-center box-line">
                <div class="row">
                    <span class="profile-insert">Contact Number</span>
                    <span class="details">(+63){{userInfo.contact_number}}</span>
                </div>
            </div>
            <div class="col-2 d-flex justify-content-center align-items-center">
                <a href="#" v-b-modal.modal-custom-1><i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </div>
        <!-- end box 3 -->

        <!-- box 4 -->
        <div class="row box-1">
            <div class="col-2 d-flex justify-content-center align-items-center">
                <i class="bi bi-envelope icon"></i>
            </div>
            <div class="col-8 d-flex align-items-center box-line">
                <div class="row">
                    <span class="profile-insert">Email</span>
                    <span class="details">{{userInfo.email}}</span>
                </div>
            </div>
            <div class="col-2 d-flex justify-content-center align-items-center">
                <a href="#" v-b-modal.modal-custom-1><i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </div>
        <!-- end box 4 -->
        <div>
            <UserModal />
        </div>
    </div>
</template>

<script>
import UserModal from './UserModal.vue';
import axios from 'axios'

export default {
     name: 'UpdateUserComp',
     data() {
         return {
            userInfo: {}
         }
    },
     components:{
        UserModal,
     },
     mounted() {
        this.getUserInfo()
    },
    methods: {

     getUserInfo(){
  

        axios.get("/user").then((response) => {
             
                  this.userInfo = response.data
                  console.log(this.userInfo)
                   
          });
      },
    }
     
}
</script>

<style scoped>
.box {
    height: 120px;
    border-bottom: 1px solid black;
}

.box-1 {
    height: 120px;
}

.box-line {
    padding: 5px;
    line-height: 35px;
}

#about::-webkit-scrollbar {
    display: none;
    /* hide scroll bar for chrome,safari and Opera */
}

#about {
    -ms-overflow-style: none;
    /* IE and Edge */
    scrollbar-width: none;
    /* Firefox */
}

#about {
    overflow: auto;
    width: 100%;
    height: 50px;
    font-size: 1rem;
    font-family: 'Poppins', 'sans-serif';
}

.details {
    font-family: 'Poppins', 'sans-serif';
    font-size: 1.1rem;
}

.icon {
    font-size: 30px;
    color: #FFC000;
}

#icon {
    font-size: 35px;
    color: #FFC000;
}

.profile-insert {
    font-size: 1.4rem;
}
.fa-chevron-right{
    font-size:25px; 
    color:#0D7CFF;
}
.fa-chevron-right:hover{
    color: #FFC000;
}
@media (max-width:1200px) {
    .details {
        font-size: 1rem;
    }
}
@media (max-width:600px) {
    .details {
        font-size: 1rem;
    }
}

@media (max-width:460px) {
    .details {
        font-size: 0.8rem;
    }

    #about {
        font-size: 0.8rem;
        font-family: 'Poppins', 'sans-serif';
    }

    .icon {
        font-size: 25px;
    }
    #icon{
        font-size: 30px;
    }

    .profile-insert {
        font-size: 1rem;
    }

    .box-line {
        padding: 5px;
        line-height: 25px;
    }

}

@media(max-width:300px) {
    .details {
        font-size: 0.7rem;
    }
    #about{
        font-size: 0.6em;
    }

    .icon {
        font-size: 20px;
    }
    #icon{
        font-size: 25px;
    }
}
</style>
<template>
  <div>
        <!-- modal username -->
        <b-modal id="modal-custom-picture" ref="modal" title="Update Profile Picture" button-size="md" body-class="p-4" centered hide-header-close
            no-close-on-backdrop header-class="justify-content-center">
            <form ref="form">
                <div class="container-fluid custom-input" style="width:80%">
                    <b-form-group label-for="name-input">
                        <div class="text-center">
                            <p style="font-size:0.9em">Please make sure that the image is in this path "/assets/profile" of the project folder
                            <span style="color:red;">*</span></p>
                        </div>
                        <b-form-input id="comp-name" v-model="name.profile_image"
                            style="border-radius: 25px; padding: 10px 15px; box-shadow: 0px 1px 1px 1px #ced6e0; background-color: ;"
                            placeholder="Please input the file name ex: 'carlo.jpg'">
                        </b-form-input>
                    </b-form-group>
                </div>
            </form>
            <template #modal-footer>
                <div class="w-100 d-flex justify-content-center align-items-center" style="column-gap: 25px">
                    <b-button size="md" @click="$bvModal.hide('modal-custom-picture')" style="width:100px; border-radius:15px; background-color: white; color:#BC9476; box-shadow: 0px 1px 1px 1px #ced6e0; border:none;">
                        Back
                    </b-button>
                    <b-button size="md" @click="submitForm" style="width:100px; border-radius:10px; background-color: #FFC000; color:white; border:none; box-shadow: 0px 1px 1px 1px #ced6e0; ">
                        Update
                    </b-button>
                </div>
            </template>
        </b-modal>
        <!-- modal username end -->
    </div>
</template>

<script>
import axios from 'axios'

export default {
    data(){
        return{
            name:{
                id:'',
                profile_image:''
            }
        }
    },

    // computed:{
    //     compnameisvalid(){
    //         return !!this.name.name_of_business
    //     },
    //     formisvalid(){
    //         return this.compnameisvalid 
    //     },
        
    // },
    mounted() {
        this.getName()
    },
    methods:{
        submitForm(){
//update method
                axios.put('/merchantupdate/'+this.name.id, this.name).then((response) => {
                    console.log(response.data)
                    window.location.reload();   
                }).catch((err) => {
                    console.log(err)
                })
        },
        getName(){

        axios.get("/user").then((response) => {
             
                  this.name = response.data

                  console.log(this.name)
                   
          });
      },

    },

}
</script>

<style scoped>

</style>
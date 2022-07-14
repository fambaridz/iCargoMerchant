<template>
  <div>
        <!-- modal username -->
        <b-modal id="modal-custom-name" ref="modal" title="Update Company Name" button-size="md" body-class="p-4" centered hide-header-close
            no-close-on-backdrop header-class="justify-content-center">
            <form ref="form" @submit.prevent="submitForm">
                <div class="container-fluid custom-input" style="width:80%">
                    <b-form-group label-for="name-input">
                        <label for="comp-name">Company Name<span style="color:red;"
                                    v-if="!compnameisvalid">*</span></label>
                        <b-form-input id="comp-name" v-model="form.companyname"
                            style="border-radius: 25px; padding: 10px 15px; box-shadow: 0px 1px 1px 1px #ced6e0; background-color: ;">
                        </b-form-input>
                    </b-form-group>
                </div>
            </form>
            <template #modal-footer>
                <div class="w-100 d-flex justify-content-center align-items-center" style="column-gap: 25px">
                    <b-button size="md" @click="$bvModal.hide('modal-custom-name')" style="width:100px; border-radius:15px; background-color: white; color:#BC9476; box-shadow: 0px 1px 1px 1px #ced6e0; border:none;">
                        Back
                    </b-button>
                    <b-button size="md" :disabled="!formisvalid" @click="submitForm" style="width:100px; border-radius:10px; background-color: #FFC000; color:white; border:none; box-shadow: 0px 1px 1px 1px #ced6e0; ">
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
            form:{
                companyname: this.company
            },
         
        }
    },

    computed:{
        compnameisvalid(){
            return !!this.form.companyname
        },
        formisvalid(){
            return this.compnameisvalid 
        },
        
    },
    methods:{
        submitForm(){
            if(this.formisvalid){

//update method

            axios.put('/updateBusiness/7',this.form).then((response)=>{
                    console.log(response.data)

            }).catch((err)=>{
                    console.log(err)
            }) 

            }else{
                console.log('invalid form')
            }
        }

    },
    props:{
        company:String
    }

}
</script>

<style scoped>

</style>
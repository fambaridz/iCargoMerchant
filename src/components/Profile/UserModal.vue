<template>
    <div>
        <!-- modal username -->
        <b-modal size="md" id="modal-custom-1" ref="modal" title="Update Profile Information" button-size="md" centered
            content-class="modal-body" hide-header-close no-close-on-backdrop header-class="justify-content-center">
            <form ref="form" @submit.prevent="submitForm" autocomplete="off">
                <div class="row custom-input">
                    <div class="col-12">
                        <b-form-group label-for="first-name" style="margin-bottom: 5px; line-height: 2em;">
                            <label for="first-name">First Name <a data-toggle="tooltip" data-placement="top" title="Please fill the input field!" style="color:red; text-decoration: none;"
                                    v-if="!fnameisvalid">*</a></label>
                            <b-form-input id="first-name" v-model="form.first_name"
                                style="border-radius: 25px; padding: 10px 15px; box-shadow: 0px 1px 1px 1px #ced6e0; margin-top: 5px;">
                            </b-form-input>
                        </b-form-group>
                    </div>
                </div>
                <div class="row custom-input">
                    <div class="col-12">
                        <b-form-group label-for="last-name" style="margin-bottom: 5px; line-height: 2em;">
                            <label for="fname">Last Name <a data-toggle="tooltip" data-placement="top" title="Please fill the input field!" style="color:red; text-decoration: none;"
                                    v-if="!lnameisvalid">*</a></label>
                            <b-form-input id="last-name" v-model="form.last_name"
                                style="border-radius: 25px; padding: 10px 15px; box-shadow: 0px 1px 1px 1px #ced6e0; margin-top: 5px;">
                            </b-form-input>
                        </b-form-group>
                    </div>
                </div>
                <div class="row custom-input">
                    <div class="col-12">
                        <b-form-group label-for="about"
                            style="margin-top: 10px; margin-bottom: 15px; line-height: 2em;">
                            <label for="text-about-input">About <a data-toggle="tooltip" data-placement="top" title="Please fill the input field!" style="color:red; text-decoration: none;"
                                    v-if="!aboutisvalid">*</a></label>
                            <b-form-textarea id="text-about-input" v-model="form.about"
                                style="border-radius: 35px; padding: 10px 20px; height: 100px; box-shadow:  0px 1px 1px 1px #ced6e0; margin-top: 5px;">
                            </b-form-textarea>
                        </b-form-group>
                    </div>
                </div>
                <div class="row d-flex justify-content-center" style="margin-top: 10px;">
                    <div class="col-lg-6 custom-input">
                        <b-form-group label-for="contact" style="margin-top: 10px;">
                            <label for="contact">Contact No. <a data-toggle="tooltip" data-placement="top" title="Please fill the input field!" style="color:red; text-decoration: none;"
                                    v-if="!contactisvalid">*</a></label>
                            <div
                                style="margin-top:5px;  box-shadow: 0px 1px 1px 1px #ced6e0; border-top-right-radius: 15px; border-bottom-right-radius: 15px;">
                                <b-input-group prepend="(+63)" style="">
                                    <b-form-input id="contact" v-model.number="form.contact_number"
                                        style=" border-top-right-radius: 15px; border-bottom-right-radius: 15px;">
                                    </b-form-input>
                                </b-input-group>
                            </div>
                        </b-form-group>
                    </div>
                    <div class="col-lg-6 custom-input">
                        <b-form-group label-for="email" style="margin-top: 10px;">
                            <label for="contact">Email <a data-toggle="tooltip" data-placement="top" title="Please fill the input field!" style="color:red; text-decoration: none;"
                                    v-if="!emailisvalid">*</a></label>
                            <div
                                style="margin-top:5px;  box-shadow: 0px 1px 1px 1px #ced6e0; border-top-right-radius: 15px; border-bottom-right-radius: 15px;">
                                <b-input-group prepend="@" style="">
                                    <b-form-input id="email" v-model="form.email"
                                        style=" border-top-right-radius: 15px; border-bottom-right-radius: 15px;">
                                    </b-form-input>
                                </b-input-group>
                            </div>
                        </b-form-group>
                    </div>
                </div>
            </form>
            <template #modal-footer>
                <div class="w-100 d-flex justify-content-center align-items-center" style="column-gap: 25px">
                    <b-button id="modal-btn" size="md" @click="$bvModal.hide('modal-custom-1')"
                        style="width:100px; border-radius:15px; background-color: white; color:#BC9476; box-shadow: 0px 1px 1px 1px #ced6e0; border:none;">
                        Back
                    </b-button>
                    <b-button id="modal-btn" size="md" :disabled="!formisvalid" @click="submitForm"
                        style="width:100px; border-radius:10px; background-color: #FFC000; color:white; border:none; box-shadow: 0px 1px 1px 1px #ced6e0; ">
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
                id:'',
                first_name: '',
                last_name: '',
                about: '',
                email: '',
                contact_number: '',
            },
        }
    },
    
    computed:{
        fnameisvalid(){
            return !!this.form.first_name
        },
        lnameisvalid(){
            return !!this.form.last_name
        },
        aboutisvalid(){
            return !!this.form.about
        },
        emailisvalid(){
            return !!this.form.email
        },
        contactisvalid(){
            return !!this.form.contact_number
        },
        formisvalid(){
            return this.fnameisvalid && this.lnameisvalid && this.aboutisvalid && this.emailisvalid && this.contactisvalid
        },
        
    },
    mounted() {
        this.getInfo()
    },
    methods:{
        submitForm(){
            if(this.formisvalid){
                axios.put('/merchantupdate/'+this.form.id, this.form).then((response) => {
                    console.log(response.data)
                    window.location.reload();
                }).catch((err) => {
                    console.log(err)
                })
            } else {
                console.log('invalid form')
            }
        },
        async getInfo(){

        await axios.get("/user").then((response) => {
             
            this.form = response.data                   
        });
      },
    },
}
</script>

<style scoped>

/deep/.modal-body{
    border-radius: 25px;
    padding-left: 25px;
    padding-right: 25px;
}
/deep/ #text-about-input::-webkit-scrollbar {
    display: none;
    /* hide scroll bar for chrome,safari and Opera */
}
/deep/ #text-about-input {
    -ms-overflow-style: none;
    /* IE and Edge */
    scrollbar-width: none;
    /* Firefox */
}

</style>
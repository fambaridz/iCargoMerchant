<template>
  <div class="newbook">
    <NavbarTop/>
    <TitleHeader/>
    <BookingDetails/>
    <NewModal/>
   
    
  </div>
</template>

<script>
import BookingDetails from './components/BookingDetails.vue'
import NavbarTop from '../Navbar/NavbarTop.vue'
import TitleHeader from './components/TitleHeader.vue'
import NewModal from './components/NewModal.vue'


export default {
  name: 'App', 

  components: {
    BookingDetails,
    NavbarTop,
    TitleHeader,
    NewModal,


    
},

  data: () => ({
    //
  }),
};
</script>
<style scoped>
.newbook{
  height: 100vh;
  background-color: white;
}
</style>

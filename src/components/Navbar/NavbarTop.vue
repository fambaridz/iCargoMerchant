<template>
  <header>
    <nav class="navbar navbar-expand-lg navbar-light menu">
      <div class="container-fluid">
        <div class="col p-2 d-flex align-items-center">
          <a class="text-decoration-none logo" href="#"
            ><img
              src="../../assets/icargologo.png"
              width="70"
              height="50"
              alt="logo image"
          /></a>
          &nbsp;<a class="text-decoration-none" href="#"
            ><span id="icargo">iCargo</span>
            <span id="pacific">Pacific</span></a
          >
        </div>

        <div class="justify-content-end d-flex align-items-center">

          <div v-if="image.profile_image !== null">
          <img :src="userWithIcon.icon" style="width:35px; height:35px; border-radius: 50%;" alt="company profile">
          </div>

          <div v-else-if="image.profile_image == null">
             <i class="fa-solid fa-circle-user" style="color: #0d7cff"></i>
          </div>

          
          &nbsp;&nbsp;<span id="user">Hi,{{userLogged.first_name}} {{userLogged.last_name}}</span>
          
          <b-dropdown id="dropdown-right" right variant="none">
            <b-dropdown-item id="item" href="/routes"
              ><i class="fa-solid fa-book-bookmark icon-body"></i>New
              Order</b-dropdown-item
            >
            <b-dropdown-item id="item" href="/toship"
              ><i class="fa-solid fa-box icon-body"></i>Orders</b-dropdown-item
            >
            <b-dropdown-item id="item" href="/profile"
              ><i class="fa-solid fa-user icon-body"></i
              >Profile</b-dropdown-item
            >
            <b-dropdown-item id="item" href="/about"
              ><i class="fa-solid fa-circle-question icon-body"></i>Help
              Center</b-dropdown-item
            >
            <b-dropdown-item id="item"  @click="logout"
              ><i class="fa-solid fa-right-from-bracket icon-body"></i
              >Logout</b-dropdown-item
            >
          </b-dropdown>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>

import axios from "axios";
export default {
  name: "NavbarTop",
  data() {
    return {
      userLogged: {},
      errors: '',
      image: {
      }

    }
  },
  computed: {
    userWithIcon() {
      return {
        ...this.image,
        icon: this.image.profile_image && require(`../../assets/profile/${this.image.profile_image}`)
      }
    }
  },
  mounted() {
    this.showuser()
  },



  methods: {

    showuser() {


      axios.get("/user").then((response) => {


        this.userLogged = response.data
        this.image = response.data

        //setting for temporarily the id of user for the booking orders. do not delete - jaq
        localStorage.setItem("book", response.data.id)
        console.log(this.userLogged)

      });
    },
    logout() {
      axios
        .post("/merchantlogout")
        .then((response) => {
          localStorage.removeItem("token");
          this.$router.push({ name: 'signinPage' })
        })
        .catch((err) => {
          //  this.errors = err
          //  console.log(err);
        });
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Libre+Baskerville&family=Poppins:ital,wght@0,600;1,400&display=swap");
.navbartop {
  padding: 1rem;
}

#icargo {
  color: #003060;
  font-family: "Poppins", "sans-serif";
  font-size: 2rem;
}
#pacific {
  color: #fbcd10;
  font-family: "Poppins", "sans-serif";
  font-size: 2rem;
}
#user {
  font-family: "Poppins", "sans-serif";
  font-size: 1.1rem;
}
.fa-circle-user {
  font-size: 2em;
}
.icon-body {
  margin-right: 15px;
  color: #0d7cff;
}
#item {
  color: black;
  font-weight: 600;
}
@media (max-width: 650px) {
  #icargo {
    font-size: 1.3rem;
  }
  #pacific {
    font-size: 1.3rem;
  }
  #user {
    display: none;
  }
}
.menu {
  background-color: white;
}
</style>

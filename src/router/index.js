import Vue from 'vue'
import VueRouter from 'vue-router'
import price from '../components/New Booking/Price/NewBooking.vue'
import details from '../components/New Booking/Other Details/NavBody.vue'
import toship from '../components/Orders/components/ToShipOrder.vue'
import ongoing from '../components/Orders/components/OngoingOrder.vue'
import complete from '../components/Orders/components/CompleteOrders.vue'
import cancel from '../components/Orders/components/CancelledOrders.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/profile',
    name: 'profile',
    component: () => import(/* webpackChunkName: "profile" */ '../components/Profile/HomeProfile.vue')
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../components/Help Center/HelpBody.vue')
  },
  {
    name:'signinPage',
    path: '/',
    component: () => import(/* webpackChunkName: "signin" */ '../components/Login/SigninPage.vue')
  },
  {
    name:'signupForm',
    path: '/signup',
    component: () => import(/* webpackChunkName: "signup" */ '../components/Login/signupForm.vue'),
    meta: { requiresAuth: true} , //PUT LIKE THIS IF YOU WANT TO PROCTECT THE ROUTE WITH UNAUTHENTICATED USER
  },
  {
    name:'registration',
    path: '/registration',
    component: () => import(/* webpackChunkName: "register" */ '../components/Login/RegistrationSuccess.vue')
  },
  {
    name:'verify',
    path: '/verify',
    component: () => import(/* webpackChunkName: "register" */ '../components/Login/verifyMerchant.vue')
  },
  {
    name:'price',
    path: '/price',
    component: price
  },
  {
    name:'routes',
    path: '/routes',
    component: () => import(/* webpackChunkName: "register" */ '../components/New Booking/Routes/ICARGO-HEADER.vue')
  },
  {
    name:'details',
    path: '/details',
    component: details
  },
  {
    name:'toship',
    path: '/toship',
    component: toship
  },
  {
    name:'ongoing',
    path: '/ongoing',
    component: ongoing
  },
  {
    name:'complete',
    path: '/complete',
    component: complete
  },
  {
    name:'cancel',
    path: '/cancel',
    component: cancel
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router

function loggedIn(){
  return localStorage.getItem('token')

 
}

router.beforeEach((to, from, next) => {
  // redirect to login page if not logged in and trying to access a restricted page
  const { requiresAuth } = to.meta;
 


if (requiresAuth) {
      if (!loggedIn()) {
         
          return next({  name: "signinPage"});
      }
  }
  next();

})

import { createRouter, createWebHistory } from 'vue-router'
import successView from '../views/successPage.vue'
import appView from '../App.vue'

const routes = [
  {
    path: '/',
    name: 'index',
    component: appView
  },
  {
    path: '/success',
    name: 'success',
    component: successView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router

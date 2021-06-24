import Vue from 'vue';
import Router from 'vue-router';
import EmployeeIndexPage from '../components/EmployeeIndexPage.vue';
import EmployeeDetailPage from '../components/EmployeeDetailPage.vue';


// Vue.use() Vueのプラグインを使う
Vue.use(Router);

// export defalt, main.jsで読み込む  vue-routerを読み込む
export default new Router({
  // mode: "history",
  routes: [
    {
      path: '/', 
      component: EmployeeIndexPage
    },
    {
      path: '/employees/:id', 
      component: EmployeeDetailPage,
    }
  ],
});

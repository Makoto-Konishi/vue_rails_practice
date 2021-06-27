import Vue from 'vue';
import Router from 'vue-router';
import EmployeeIndexPage from '../components/EmployeeIndexPage.vue';
import EmployeeDetailPage from '../components/EmployeeDetailPage.vue';
import EmployeeNewPage from '../components/EmployeeNewPage.vue';
import EmployeeEditPage from '../components/EmployeeEditPage.vue';


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
      // idは数字だけに制限
      path: '/employees/:id(\\d+)', 
      component: EmployeeDetailPage,
      name: 'EmployeeDetailPage',
      props: true
    },
    {
      path: '/employees/new',
      name: 'EmployeeNewPage',
      component: EmployeeNewPage
    },
    {
      path: '/employees/:id(\\d+)/edit',
      name: 'EmployeeEditPage',
      component: EmployeeEditPage,
      props: true
    }
  ]
});

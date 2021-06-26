<template>
<div>
  <employee-form-pane :errors="errors" :employee="employee" @submit="createEmployee">
  </employee-form-pane>
</div>
</template>

<script>
import axios from 'axios';

import EmployeeFormPane from '../components/EmployeeFormPane.vue'

export default {
  components: {
    EmployeeFormPane
  },
  data: function () {
    return {
      employee: {
        name: '',
        department: '',
        gender: '',
        birth: '',
        joined_date: '',
        payment: '',
        note: ''
      },
      errors: ''
    }
  },
  methods: {
    createEmployee: function(){
      axios.post('api/v1/employees', this.employee)
      .then( response => {
        let e = response.data;
        // 異なる URL へ遷移するときに router.push が使える。
        // このメソッドは history スタックに新しいエントリを追加する。それによってユーザーがブラウザの戻るボタンをクリックした時に前の URL に戻れるようになる。
        this.$router.push({name: 'EmployeeDetailPage', params: {id: e.id} });
      })
      .catch(error => {
        console.error(error);
        if (error.response.data && error.response.data.errors) {
          this.errors = error.response.data.errors;
        }
      })
    }
  }
}
</script>

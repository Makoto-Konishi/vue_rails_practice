<template>
<div>
  <form :errors="errors" :employee="employee" @submit="createEmployee">
    <!-- Vue コンポーネントの errors データに要素が格納されている場合にそれらをリストアップ -->
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
       <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>

    <div>
      <label >Name</label>
      <input v-model="employee.name" type="text">
    </div>
    <div>
      <label >Department</label>
      <input v-model="employee.department" type="text">
    </div>
    <div>
      <label >Gender</label>
      <select v-model="employee.gender">
        <option>other</option>
        <option>male</option>
        <option>female</option>
      </select>
    </div>
    <div>
      <label >Birth</label>
      <input v-model="employee.birth" type="date">
    </div>
    <div>
      <label >Joined date</label>
      <input v-model="employee.joined_date" type="date">
    </div>
    <div>
      <label >Payment</label>
      <input v-model="employee.payment" type="number" min=0>
    </div> 
    <div>
      <label >Note</label>
      <input v-model="employee.note" type="text">
    </div>
    <button type="submit">送信</button>
  </form>
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

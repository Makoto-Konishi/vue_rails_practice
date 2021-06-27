<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>department</th>
          <th>gender</th>
        </tr>
        <tr v-for="(e, index) in employees" :key="e.id">
          <td>{{ e.id }}</td>
          <td><router-link :to="{name: 'EmployeeDetailPage', params: {id: e.id}}">{{ e.name }}</router-link></td>
          <td>{{ e.department }}</td>
          <td>{{ e.gender }}</td>
          <td>
            <button @click="showModal = true">Delete</button>
            <modal v-if="showModal" @cancel="showModal = false" @ok="deleteEmployee(e.id, index); showModal = false;">
              <div slot="body">Are you sure?</div>
            </modal>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

import Modal from '../components/Modal.vue';

export default{
  components: {
    Modal
  },
  data(){
    return{
      employees: [],
      showModal: false,
      errors: ''
    }
  },
  mounted(){
    this.mountEmployees();
  },
  methods: {
    mountEmployees(){
      axios.get('api/v1/employees.json')
      .then( response => {
        this.employees = response.data;
      })
    },
    deleteEmployee(employee_id, index){
      axios.delete(`/api/v1/employees/ ${employee_id}.json`)
      .then( response => {
        this.employees.splice(index, 1);
        this.mountEmployees();
      })
      .catch( error => {
        console.error(error);
        if(error.response.data && error.response.data.errors){
          this.errors = error.response.data.errors;
        }
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

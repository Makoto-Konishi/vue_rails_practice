<template>
<div>
  <employee-form-pane :errors="errors" :employee="employee" @submit="updateEmployee"></employee-form-pane>
</div>
</template>
<script>
import axios from 'axios';
import EmployeeFormPane from '../components/EmployeeFormPane.vue'
export default {
  props: ['id'],
  components: {
    EmployeeFormPane
  },
  data(){
    return {
      employee: {},
      errors: ''
    }
  },
  mounted(){
    // showのurlをgetして値もそのまま
    axios.get(`/api/v1/employees/${this.id}.json`)
    .then(response => {
      this.employee = response.data;
    })
  },
  methods: {
    updateEmployee: function(){
      axios.patch(`/api/v1/employees/${this.id}.json`, this.employee)
      .then( response => {
        this.$router.push({ name: 'EmployeeDetailPage', params: {id: this.employee.id} });
      })
      .catch(error => {
        console.error(error);
        if(error.response.data && error.response.data.errors){
          this.errors = error.response.data.errors;
        }
      })
    }
  }
}
</script>

<template>
<div>

  <dl>
    <dt>ID</dt>
    <dd>{{ employee.id }}</dd>
    <dt>Name</dt>
    <dd>{{ employee.name }}</dd>
    <dt>Department</dt>
    <dd>{{ employee.department }}</dd>
    <dt>Gender</dt>
    <dd>{{ employee.gender }}</dd>
    <dt>Birth</dt>
    <dd>{{ employee.birth }}</dd>
    <dt>Joined Date</dt>
    <dd>{{ employee.joined_date }}</dd>
    <dt>Payment</dt>
    <dd>{{ employee.payment }}</dd>
    <dt>Note</dt>
    <dd>{{ employee.note }}</dd>
  </dl>
  <router-link :to="{name: 'EmployeeEditPage', params: {id: id }}">編集</router-link>
</div>
</template>

<script>
import axios from 'axios';

export default {
  props: ['id'],
  data: function () {
    return {
      employee: {}
    }
  },
  mounted () {
    this.mountDetail();
  },
  methods: {
    mountDetail(){
      axios.get(`/api/v1/employees/${this.id}.json`)
      .then(response => {
        console.log(response.data);
        this.employee = response.data
      })
    }
  }
}
</script>

<style scoped>
</style>

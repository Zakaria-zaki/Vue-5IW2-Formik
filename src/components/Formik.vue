<template>
    <form @submit.prevent="handleSubmit" v-on:input="handleInput" ref="form">
      <slot />
      <p v-for="error in errors" :key="error">- {{error}}</p>
      <br>
      
    </form>
</template>
  
  <script>

  export default {
    

    name: 'Formik',
    provide() {
      return {
        values: this.values,
        errors: this.errors,
      };
    },
    props: {
      initialValues: {
        type: Object,
        required: true,
      },
      validate: {
        type: Function,
        required: true,
      },
    },
    watch:{
      values(value){                 
        this.errors = this.validate(this.values);
        let button = this.$refs.form.querySelector("[type=submit]");
        if (Object.keys(this.errors).length === 0) {
          button.removeAttribute('disabled');
        }
          else{ 
            button.setAttribute('disabled',true);
        }
      },
    },
    data() {
      return {
        values: this.initialValues,
        errors: {},
      };
    },
    methods: {
      handleSubmit() {
        this.errors = this.validate(this.values);
        if (Object.keys(this.errors).length === 0) {
          this.$emit('submit', this.values);
        }
      },
      handleInput(event, data) {
        let form = this.$refs.form;
        let values = {};
        let inputs = form.querySelectorAll('input');
        for (let i = 0; i < form.elements.length; i++) {
        let element = form.elements[i];
        if (element.name) {
          values[element.name] = element.value;
        }
      }
      this.values=values
      },
    },
  };
  </script>

<style>

p{
  color: red;
}
</style>
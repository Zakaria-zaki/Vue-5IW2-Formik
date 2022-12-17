<template>
    <form @submit.prevent="handleSubmit" v-on:input="handleInput" ref="form">
      <slot />
      <button type="submit" :disabled="!isSubmitting" >Submitt</button>
    </form>
</template>
  
  <script>

  export default {
    

    name: 'Formik',
    provide() {
      return {
        values: this.values,
        errors: this.errors,
        isSubmitting:this.isSubmitting
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

        if (Object.keys(this.errors).length === 0) {
          this.isSubmitting = true;
          this.$emit('submit', this.values);
        }
        else this.isSubmitting = false;
      },
    },
    data() {
      return {
        values: this.initialValues,
        errors: {},
        isSubmitting: false,
      };
    },
    methods: {
      handleSubmit() {
        this.errors = this.validate(this.values);
  
        if (Object.keys(this.errors).length === 0) {
          this.isSubmitting = true;
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
      console.log(this.values)
      },
    },
  };
  </script>
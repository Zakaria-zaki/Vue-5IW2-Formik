<template>
    <form @submit.prevent="handleSubmit">
      <slot />
      <button type="submit" :disabled="!isSubmitting">Submitt</button>
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
    },
  };
  </script>
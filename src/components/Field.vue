<template>
    <div>
      <label>{{ as }}:</label>
      <input
        v-model="values[name]"
        :type="type"
        :disabled="isSubmitting"
      />
      <span>{{ errors[name] }}</span>
    </div>
  </template>
  
  <script>
  import { inject } from 'vue';
  
  export default {
    name: 'Field',
    props: {
      name: {
        type: String,
        required: true,
      },
      as: {
        type: String,
        required: true,
      },
      type: {
        type: String,
      },
    },
    setup() {
      const values = inject('values');
      const errors = inject('errors');
      const isSubmitting = inject('isSubmitting');
      
      return {
        values,
        errors,
        isSubmitting,
      };
    },
  };
  </script>
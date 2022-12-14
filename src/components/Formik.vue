<template>
    <form @submit.prevent="handleSubmit">
      <slot></slot>
      <button type="submit" :disabled="isSubmitting">Submit</button>
    </form>
  </template>
  
  <script>
  import { reactive, toRefs } from 'vue'
  
  export default {
    name: 'Formik',
  
    props: {
      initialValues: {
        type: Object,
        default: () => ({}),
      },
      validate: {
        type: Function,
        default: () => ({}),
      },
      onSubmit: {
        type: Function,
        required: true,
      },
    },
  
    setup(props) {
      const state = reactive({
        values: props.initialValues,
        errors: {},
        isSubmitting: false,
      })
  
      const handleSubmit = async () => {
        // Validate the form data
        state.errors = validate(state.values)
  
        if (Object.keys(state.errors).length === 0) {
          state.isSubmitting = true
          await props.onSubmit(state.values)
          state.isSubmitting = false
        }
      }
  
      return {
        ...toRefs(state),
        handleSubmit,
      }
    },
  }
  </script>
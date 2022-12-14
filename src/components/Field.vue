<template>
    <div>
      <label>{{ label }}</label>
      <component
        :is="as"
        v-model="value"
        :error="errors[name]"
      />
    </div>
  </template>
  
  <script>
  import { toRefs, reactive } from 'vue'
  
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
    },
    setup(props, context) {
      const formik = context.parent
  
      const state = reactive({
        value: formik.values[props.name],
      })
  
      watch(
        () => state.value,
        (newValue) => {
          formik.values[props.name] = newValue
        }
      )
      
      return {
        ...toRefs(state),
        ...toRefs(formik),
        label: props.name[0].toUpperCase() + props.name.slice(1),
      }
    },
  }
  </script>
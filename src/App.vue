<template>
  <div id="app">
    <Formik :initialValues="initialValues" :validate="validate" @submit="onSubmit">
      <Field name="name" as="input" />
      <Field name="email" as="input" />
      <Field name="password" as="input" type="password" />
      <Field name="passwordConfirmation" as="input" type="password" />
    </Formik>
  </div>
</template>

<script>
import Formik from './components/Formik.vue'
import Field from './components/Field.vue'

export default {
  name: 'App',
  components: {
    Formik,
    Field,
  },
  data() {
    return {
      initialValues: {
        name: '',
        email: '',
        password: '',
        passwordConfirmation: '',
      },
      validate(values) {
        const errors = {}
        if (values.password !== values.passwordConfirmation) {
          errors.passwordConfirmation = 'Passwords do not match'
        }
        return errors
      },
      onSubmit(values) {
        console.log(values)
      },
    }
  },
}
</script>
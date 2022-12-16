<template>
  <Formik :initialValues="initialValues" :validate="validate" @submit="onSubmit">
    <Field name="name" as="input" />
    <Field name="email" as="input" />
    <Field name="password" as="input" type="password" />
    <Field name="passwordConfirmation" as="input" type="password" />
    <Field name="favoriteColor" as="select">
      <option value="red">Red</option>
      <option value="green">Green</option>
      <option value="blue">Blue</option>
    </Field>
  </Formik>
</template>

<script>
import Formik from './components/Formik.vue';
import Field from './components/Field.vue';

export default {
  name: 'MyForm',
  components: {
    Formik,
    Field,
  },
  data() {
    return {
      initialValues: {
        name: 'zefzef',
        email: 'zefz',
        password: '',
        passwordConfirmation: '',
        favoriteColor: 'red',
      },
    };
  },
  methods: {
    validate(values) {
        const errors = {};
        if (!values.name) {
          errors.name = 'Please provide a name';
        }
        if (!values.email) {
          errors.email = 'Please provide an email address';
        }
        if (values.password !== values.passwordConfirmation) {
          errors.passwordConfirmation = 'Passwords do not match';
        }
        return errors;
},
    onSubmit(values) {
      console.log("ok :" )
    },
  },
};
</script>
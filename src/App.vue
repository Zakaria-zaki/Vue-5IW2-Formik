<template>
  <Formik :initialValues="initialValues" :validate="validate" @submit="onSubmit">
    <Field name="name" as="input" />
    <Field name="email" as="input" />
    <Field name="password" as="input" type="password" />
    <Field name="passwordConfirmation" as="input" type="password" />
    <Field name="role" as="select">
      <option value="client">Client</option>
      <option value="admin">Admin</option>
    </Field>
    <button type="submit"  >Submitt</button>
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
        name: '',
        email: '',
        password: '',
        passwordConfirmation: '',
        role: 'client',
      },
    };
  },
  methods: {
    //exemple of validation funtion ( passwod should be equele to passwordConfirmation )
    validate(values) {
        const errors = {};
        if (values.password !== values.passwordConfirmation || values.password =='') {
          errors.passwordConfirmation = 'Password and  passwordConfirmation do not match';
        }
        return errors;
},
    onSubmit(values) {
      window.alert(JSON.stringify(values));
    },
  },
};
</script>
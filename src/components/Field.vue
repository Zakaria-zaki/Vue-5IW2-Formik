<template >
    <div>
      <label>{{ as }}:</label>
      <component :is="as" :value="values[name]" :name="name" @input="updateValue" :disabled="isSubmitting" >
        <slot />
      </component>
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
    methods: {
      updateValue(event) {
        this.values = { ...this.values, [this.name]: event.target.value };
        this.$emit('input', event, this.values[this.name]);
        console.log(this.values)
      },
    },
    beforeMount(){
    }
  };
  </script>
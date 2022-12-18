<template >
    <div>
      <label>{{ name }}:</label>
      <component :is="as" :value="values[name]" :name="name" @input="updateValue"  >
        <slot />
      </component>
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

      return {
        values,
        
      };
    },
    methods: {
      updateValue(event) {
        this.values = { ...this.values, [this.name]: event.target.value };
        this.$emit('input', event, this.values[this.name]);
      },
    },
    beforeMount(){
    }
  };
  </script>
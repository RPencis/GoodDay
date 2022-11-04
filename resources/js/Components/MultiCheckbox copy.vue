<script setup>

import Checkbox from './Checkbox.vue';
import { ref } from 'vue';

const props = defineProps({
    value: {
        type: Object,
        required: true,
    },
    options: {
        type: Object,
        required: true,
        validator: (value) => {
            const hasNameKey = value.every((option) =>
                Object.keys(option).includes("name")
            );
            const hasIdKey = value.every((option) =>
                Object.keys(option).includes("id")
            );
            return hasNameKey && hasIdKey;
        },
    },
})

let updatedValue = [...props.value];

function check(optionId, checked) {
    if (checked) {
        updatedValue.push(optionId);
    } else {
        updatedValue.splice(updatedValue.indexOf(optionId), 1);
    }
    console.log(updatedValue);
}

</script>  

<template>
    <div class="flex flex-col  justify-center w-64 border-2 border-gray-400 p-8 rounded-lg ">
        <label class="" v-for="option in options">
            <Checkbox :checked="value.includes(option.id)" ref="updatedValue" @update:checked="check(option.id, $event)" :key="option" />
            {{ option.name }}
        </label>
    </div>
</template>
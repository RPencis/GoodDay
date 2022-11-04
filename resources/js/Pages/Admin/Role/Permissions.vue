<script setup>

import Checkbox from '@/Components/Checkbox.vue';
import AppLayout from '@/Layouts/AppLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';


const props = defineProps({
    role: {
        type: Object,
        default: () => ({}),
    },
    permissionsOptions: {
        type: Array,
        default: () => ([]),
    },
    permissionsEnabled: {
        type: Array,
        default: () => ([]),
    },
})
const form = useForm({
    name: '',
    permissions: [],
});

props.permissionsEnabled.forEach(element => {
    form.permissions.push(element);
});

function check(optionId, checked) {
    if (checked) {
        form.permissions.push(optionId);
    } else {
        form.permissions.splice(form.permissions.indexOf(optionId), 1);
    }
}
</script>

<template>

    <Head title="Role Permissions" />
    <AppLayout title="Role Permissions">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ role.name[0].toUpperCase() + role.name.substring(1) }} Permissions
            </h2>
        </template>
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

                <div v-if="$page.props.flash.message"
                    class="p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg dark:bg-green-200 dark:text-green-800"
                    role="alert">
                    <span class="font-medium">
                        {{ $page.props.flash.message }}
                    </span>
                </div>

                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">
                        <form @submit.prevent="form.put(route('role.permissionsStore', this.role.id))">
                            <div class="flex items-center justify-center">
                                <div
                                    class="flex flex-col  justify-center w-64 border-2 border-gray-400 p-8 rounded-lg ">
                                    <label class="" v-for="option in permissionsOptions">
                                        <Checkbox :checked="permissionsEnabled.includes(option.id)"
                                            @update:checked="check(option.id, $event)" :key="option"
                                        />
                                        {{ option.name }}
                                    </label>
                                </div>
                            </div>
                            <div class="flex items-center justify-end mt-4">
                                <PrimaryButton class="ml-4" :class="{ 'opacity-25': form.processing }"
                                    :disabled="form.processing">
                                    Save
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
  

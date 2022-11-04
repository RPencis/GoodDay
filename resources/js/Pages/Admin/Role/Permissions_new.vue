<script setup>
import CheckBoxGroup from "@/Components/CheckBoxGroup.vue";
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import AppLayout from '@/Layouts/AppLayout.vue';

const props = defineProps({
    role: {
        type: Object,
        default: () => ({}),
    },
    permissionsOptions: {
        type: Array,
        default: () => ([]),
    }
})
const onChange = (val) => {
    console.log(val);
    form.permissions = val;
};
const form = useForm({
    permissions: [],
});
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
                            <CheckBoxGroup :items="props.permissionsOptions" @on-change="onChange" />
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
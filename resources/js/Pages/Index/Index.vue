<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import DataView from './Data.vue';

const props = defineProps({
    blogs: {
        type: Object,
        default: () => ({}),
    },
    allNews: {
        type: Object,
        default: () => ({}),
    },
    canLogin: Boolean,
    canRegister: Boolean,
})

</script>

<template>

    <Head title="Welcome" />
    <div v-if="null === $page.props.user" class="flex items-top justify-center bg-gray-100 sm:items-center sm:pt-0"
        style="min-height:50px;">
        <div v-if="canLogin" class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
            <Link :href="route('login')" class="text-sm text-gray-700 dark:text-gray-500 underline">Log in</Link>
            <Link v-if="canRegister" :href="route('register')"
                class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Register</Link>
        </div>
    </div>
    <AppLayout v-if="$page.props.user" title="Welcome">
        <DataView :blogs="props.blogs" :allNews="props.allNews" />
    </AppLayout>
    <DataView :blogs="props.blogs" :allNews="props.allNews" v-else />
</template>
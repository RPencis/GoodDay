<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from "@inertiajs/inertia-vue3";

const props = defineProps({
    news: {
        type: Object,
        default: () => ({}),
    }
})

</script>

<template>
    <AppLayout title="News">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ news.title }}
                <Link :href="route('news.index')" class="no-underline hover:underline text-cyan-600 dark:text-cyan-400">
                &lt;&lt; Back to all news
                </Link>
            </h2>
        </template>

        <div class="px-4 py-5 bg-white sm:p-6 shadow sm:rounded-tl-md sm:rounded-tr-md">
            <div class="max-w-7xl mx-auto py-10 sm:px-6 lg:px-8">
                <div>
                    {{ news.text }}
                </div>
            </div>
        </div>
    </AppLayout>
</template>
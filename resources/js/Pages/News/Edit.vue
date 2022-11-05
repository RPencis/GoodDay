<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Head, Link, useForm } from "@inertiajs/inertia-vue3";
import PrimaryButton from '@/Components/PrimaryButton.vue';
const props = defineProps({
    news: {
        type: Object,
        default: () => ({}),
    },
});

const form = useForm({
    _method: 'put',
    title: props.news.title,
    short_description: props.news.short_description,
    text: props.news.text,
});
</script>
<template>

    <Head title="Update news" />
    <AppLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                News
            </h2>
        </template>
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">
                        <div class="flex flex-col">
                            <div>
                                <h1
                                    class="inline-block text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight dark:text-slate-200 py-4 block sm:inline-block flex">
                                    Update news
                                </h1>
                                <Link :href="route('news.index')"
                                    class="no-underline hover:underline text-cyan-600 dark:text-cyan-400">
                                &lt;&lt; Back to all news
                                </Link>
                            </div>
                            <div class="w-full py-2 bg-white overflow-hidden">
                                <form @submit.prevent="
                                    form.post(route('news.update', this.news.id))
                                ">
                                    <div class="py-2">
                                        <label class="block font-bold text-sm text-gray-700"
                                            :class="{ 'text-red-400': form.errors.title }" for="title">
                                            Title
                                        </label>
                                        <input
                                            class="my-2 rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 block w-full"
                                            :class="{ 'border-red-400': form.errors.title }" id="title" type="text"
                                            v-model="form.title" />
                                        <div class="text-red-400 text-sm" v-if="form.errors.title">
                                            {{ form.errors.title }}
                                        </div>
                                    </div>
                                    <div class="py-2">
                                        <label class="block font-bold text-sm text-gray-700"
                                            :class="{ 'text-red-400': form.errors.short_description }"
                                            for="short_description">
                                            Short Description
                                        </label>
                                        <input
                                            class="my-2 rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 block w-full"
                                            :class="{ 'border-red-400': form.errors.short_description }"
                                            id="short_description" type="text" v-model="form.short_description" />
                                        <div class="text-red-400 text-sm" v-if="form.errors.short_description">
                                            {{ form.errors.short_description }}
                                        </div>
                                    </div>
                                    <div class="py-2">
                                        <label class="block font-bold text-sm text-gray-700"
                                            :class="{ 'text-red-400': form.errors.text }" for="text">
                                            Text
                                        </label>
                                        <input
                                            class="my-2 rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 block w-full"
                                            :class="{ 'border-red-400': form.errors.text }" id="text" type="text"
                                            v-model="form.text" />
                                        <div class="text-red-400 text-sm" v-if="form.errors.text">
                                            {{ form.errors.text }}
                                        </div>
                                    </div>
                                    <div class="flex justify-end mt-4">
                                        <PrimaryButton class="ml-4" :class="{ 'opacity-25': form.processing }"
                                            :disabled="form.processing">
                                            Update
                                        </PrimaryButton>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
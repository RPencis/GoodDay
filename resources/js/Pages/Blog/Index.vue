<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import Pagination from "@/Components/Admin/Pagination.vue";
import Sort from "@/Components/Admin/Sort.vue";

const props = defineProps({
    blogs: {
        type: Object,
        default: () => ({}),
    },
    user: {
        type: Object
    },
    filters: {
        type: Object,
        default: () => ({}),
    },
    can: {
        type: Object,
        default: () => ({}),
    },
})
const form = useForm({
    search: props.filters.serach,
})
const formDelete = useForm({})
function destroy(id) {
    if (confirm("Are you sure you want to delete?")) {
        formDelete.delete(route('blog.destroy', id));
    }
}
</script>

<template>

    <Head title="Blog" />
    <AppLayout title="Blog">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Blogs
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
                        <div class="flex flex-col mt-8">

                            <div class="d-print-none with-border mb-8">
                                <div v-if="can.create" class="d-print-none with-border mb-8">
                                    <Link :href="route('blog.create')"
                                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                                    Add Blog</Link>
                                </div>
                            </div>
                            <div class="py-2">
                                <div class="min-w-full border-b border-gray-200 shadow overflow-x-auto">
                                    <form @submit.prevent="form.get(route('blog.index'))">
                                        <div class="py-2 flex">
                                            <div class="flex pl-4">
                                                <input type="search" v-model="form.search"
                                                    class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
                                                    placeholder="Search">
                                                <button type='submit'
                                                    class='ml-4 inline-flex items-center px-4 py-2 bg-gray-800 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:ring ring-gray-300 disabled:opacity-25 transition ease-in-out duration-150'>
                                                    Search
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    <table class="border-collapse table-auto w-full text-sm">
                                        <thead>
                                            <tr>
                                                <th
                                                    class="py-2 px-4 bg-gray-50 font-bold uppercase text-sm text-grey-dark border-b border-grey-light text-left">
                                                    <Sort label="Title" attribute="title" />
                                                </th>
                                                <th class="py-2 px-4 bg-gray-50 font-bold uppercase text-sm text-grey-dark border-b border-grey-light text-left">
                                                    Short Description
                                                </th>
                                                <th
                                                    class="py-2 px-4 bg-gray-50 font-bold uppercase text-sm text-grey-dark border-b border-grey-light text-left">
                                                    Actions
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody class="bg-white dark:bg-slate-800">
                                            <tr v-for="blog in blogs.data" :key="blog.id">
                                                <td
                                                    class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">
                                                    <div class="text-sm text-gray-900">
                                                        <a :href="route('blog.show', blog.id)"
                                                            class="no-underline hover:underline text-cyan-600 dark:text-cyan-400">{{
                                                                    blog.title
                                                            }}</a>
                                                    </div>
                                                </td>
                                                <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">
                                                    {{blog.short_description}}
                                                </td>
                                                <td
                                                    class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">
                                                    <div class="flex">
                                                        <Link v-if="can.edit && blog.user_create == user.id"
                                                            :href="route('blog.edit', blog.id)"
                                                            class="inline-flex items-center px-4 py-2 text-white mr-4 bg-blue-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray transition ease-in-out duration-150 px-4 py-2 text-white">
                                                        Edit
                                                        </Link>
                                                        <PrimaryButton v-if="can.delete && blog.user_create == user.id"
                                                            class="px-4 py-2 text-white bg-red-600"
                                                            @click="destroy(blog.id)">
                                                            Delete
                                                        </PrimaryButton>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="py-8">
                                    <Pagination class="mt-6" :data="blogs" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>


<!--  -->
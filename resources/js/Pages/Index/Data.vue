<script setup>
const props = defineProps({
    blogs: {
        type: Object,
        default: () => ({}),
    },
    allNews: {
        type: Object,
        default: () => ({}),
    }
})
</script>

<template>

    <div class="flex justify-center min-h-screen sm:items-center">
        <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
            <div class="mt-8 bg-white overflow-hidden shadow sm:rounded-lg">
                <div class="min-w-full border-b border-gray-200 shadow overflow-x-auto">
                    <div>
                        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                            Blogs
                        </h2>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-3 gap-4 lg:gap-4">
                        <div class="p-4 rounded-md flex items-center justify-center" 
                            v-for="blog in blogs"
                            :key="blog.id">
                            <div class="grid grid-rows-3 grid-flow-col gap-4">
                                <div>picture</div>
                                <div>
                                    <a :href="route('blog.show', blog.id)"
                                        class="no-underline hover:underline text-cyan-600 dark:text-cyan-400">
                                        {{ blog.title }}
                                    </a>
                                </div>
                                <div>{{ blog.short_description }}</div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                            News
                        </h2>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-3 gap-4 lg:gap-4">
                        <div class="p-4 rounded-md flex items-center justify-center" 
                            v-for="news in allNews"
                            :key="news.id">
                            <div class="grid grid-rows-2 grid-flow-col gap-4">
                                <div>
                                    <a :href="route('news.show', news.id)"
                                        class="no-underline hover:underline text-cyan-600 dark:text-cyan-400">
                                        {{ news.title }}
                                    </a>
                                </div>
                                <div>{{ news.short_description }}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>
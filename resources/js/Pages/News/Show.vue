<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
    sessions: Array,
});
</script>

<template>
    <AppLayout title="News">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                News
            </h2>
        </template>

        <div>
            <div class="max-w-7xl mx-auto py-10 sm:px-6 lg:px-8">
                <!-- <div v-if="$page.props.jetstream.canUpdateProfileInformation">
                    <UpdateProfileInformationForm :user="$page.props.user" />

                    <SectionBorder />
                </div> -->

                
            </div>
        </div>
    </AppLayout>
</template>
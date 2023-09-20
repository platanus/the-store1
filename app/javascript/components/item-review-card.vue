<script setup lang="ts">
import parseDate from '../utils/parse-date';
import type { Review } from '../api/reviews';

type Props = {
  review: Review
};
defineProps<Props>();
</script>

<template>
  <div class="mb-8">
    <p class="max-w-3xl break-words text-left leading-normal">
      {{ review.comment }}
    </p>
    <div class="flex w-full justify-between py-4">
      <p class="text-base font-bold leading-normal text-zinc-800">
        {{ review.user.email }}
      </p>
      <p class="text-sm font-normal leading-tight text-zinc-500">
        {{ parseDate(review.createdAt) }}
      </p>
    </div>
    <hr class="mx-12 my-4 border-zinc-800">
  </div>
</template>

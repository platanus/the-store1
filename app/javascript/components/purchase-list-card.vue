<script setup lang="ts">
import type { Purchase } from 'api/purchases';

type Props = {
  purchase: Purchase,
};
defineProps<Props>();
const tagColorClasses = {
  pending: 'bg-yellow-50 border border-yellow-500 text-yellow-500',
  delivered: 'bg-green-50 border border-green-500 text-green-500',
};
const tagText = {
  pending: 'En proceso',
  delivered: 'Entregado',
};
</script>

<template>
  <div class="flex w-full items-center justify-between rounded-md bg-white px-4 py-3 shadow-md">
    <span class="w-1/4 text-zinc-800">{{ purchase.item.name }}</span>
    <span
      v-if="purchase.purchaseDate"
      class="text-zinc-500"
    >{{ purchase.purchaseDate }}</span>
    <span
      v-else
      class="text-zinc-500"
    >-</span>
    <div
      :class="tagColorClasses[purchase.status]"
      class="rounded-md px-2 py-0.5 font-medium"
    >
      {{ tagText[purchase.status] }}
    </div>
    <a :href="`/purchases/${purchase.id}`">
      <inline-svg
        :src="require('/app/assets/images/icons/arrow-right.svg')"
        alt="arrow-right"
      />
    </a>
  </div>
</template>

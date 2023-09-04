<script setup lang="ts">
import type { Purchase } from '../api/purchases';
import PurchaseListCard from './purchase-list-card.vue';

type Props = {
  purchases: Purchase[]
};
defineProps<Props>();
</script>

<template>
  <div class="flex w-full flex-col gap-y-4">
    <purchase-list-card
      v-for="purchase in purchases"
      :key="purchase.id"
      :purchase="purchase"
    />
  </div>
</template>

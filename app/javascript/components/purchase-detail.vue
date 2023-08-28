<script setup lang="ts">
import type { Purchase } from '../api/purchases';
import PurchaseProductCard from './purchase-product-card.vue';

type Props = {
  purchase: Purchase
};
defineProps<Props>();
</script>

<template>
  <div class="flex w-full flex-col gap-y-4">
    <purchase-product-card
      :purchase="purchase"
    />
    <!-- {{ purchase }} -->
  </div>
</template>

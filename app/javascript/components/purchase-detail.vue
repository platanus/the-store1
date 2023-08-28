<script setup lang="ts">
import type { Purchase } from '../api/purchases';
import PurchaseProductCard from './purchase-product-card.vue';
import PurchaseMessage from './purchase-message.vue';
import BackButton from './back-button.vue';

type Props = {
  purchase: Purchase
  status: string
};
defineProps<Props>();
</script>

<template>
  <div class="flex w-full flex-col gap-y-4">
    <back-button />
    <purchase-message />
    <purchase-product-card
      :purchase="purchase"
    />
  </div>
</template>

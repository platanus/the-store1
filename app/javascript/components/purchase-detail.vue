<script setup lang="ts">
import type { Purchase } from '../api/purchases';
import PurchaseProductCard from './purchase-product-card.vue';
import PurchaseMessage from './purchase-message.vue';
import BackButton from './back-button.vue';
import PurchaseDeliveryCompany from './purchase-delivery-company.vue';
import PurchaseDeliveryDateCard from './purchase-delivery-date-card.vue';

type Props = {
  purchase: Purchase
  status: string
};
defineProps<Props>();
</script>

<template>
  <div class="flex w-full flex-col gap-y-4 space-y-8">
    <back-button
      :redirect-url="'/purchases'"
    />
    <purchase-message
      v-if="!updatePurchase.deliveryCompany"
    />
    <purchase-product-card
      :purchase="purchase"
    />
    <purchase-delivery-company />
    <purchase-delivery-date-card />
  </div>
</template>

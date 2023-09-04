<script setup lang="ts">
import type { Purchase } from '../api/purchases';
import PurchaseProductCard from './purchase-product-card.vue';
import PurchaseMessage from './purchase-message.vue';
import BackButton from './back-button.vue';
import PurchaseDeliveryCompany from './purchase-delivery-company.vue';
import PurchaseDeliveryDateCard from './purchase-delivery-date-card.vue';

type Props = {
  purchase: Purchase
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
    <purchase-delivery-company
      v-if="purchase.deliveryCompany"
      :name="purchase.deliveryCompany.name"
      :phone-number="purchase.deliveryCompany.phoneNumber"
    />
    <purchase-delivery-date-card
      v-if="purchase.purchaseDate && purchase.status === 'pending'"
      :date="purchase.purchaseDate"
      :purchase-id="purchase.id"
    />
  </div>
</template>

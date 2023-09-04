<script setup lang="ts">
import { ref } from 'vue';
import type { Purchase } from '../api/purchases';
import PurchaseProductCard from './purchase-product-card.vue';
import PurchaseMessage from './purchase-message.vue';
import BackButton from './back-button.vue';
import PurchaseDeliveryCompany from './purchase-delivery-company.vue';
import PurchaseDeliveryDateCard from './purchase-delivery-date-card.vue';

type Props = {
  purchase: Purchase
};
const props = defineProps<Props>();

const updatePurchase = ref(props.purchase);

function updatePurchaseDate(purchaseDate: Date) {
  updatePurchase.value.purchaseDate = purchaseDate;
}
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
      :purchase="updatePurchase"
    />
    <purchase-delivery-company
      v-if="updatePurchase.deliveryCompany"
      :name="updatePurchase.deliveryCompany.name"
      :phone-number="updatePurchase.deliveryCompany.phoneNumber"
    />
    <purchase-delivery-date-card
      v-if="updatePurchase.purchaseDate && purchase.status === 'pending'"
      :date="updatePurchase.purchaseDate"
      :purchase-id="updatePurchase.id"
      @update-purchase-date="updatePurchaseDate"
    />
  </div>
</template>

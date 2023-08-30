<script setup lang="ts">
import { computed } from 'vue';
import type { Purchase } from '../api/purchases';

type Props = {
  purchase: Purchase
};
const props = defineProps<Props>();
const dateFormat = computed(() => new Date(props.purchase.createdAt).toISOString().split('T')[0]);
const isDelivered = computed(() => props.purchase.status !== 'pending');
</script>

<template>
  <div class="inline-flex h-auto w-full flex-col items-start justify-start rounded-2xl border border-zinc-500 bg-white shadow">
    <div class="inline-flex items-start justify-start gap-2.5 self-stretch border-b border-zinc-500 px-8 py-3">
      <div
        v-if="!isDelivered"
        class="text-center text-2xl font-bold leading-loose text-zinc-800"
      >
        Tu compra
      </div>
      <div
        v-else
        class="text-center text-2xl font-bold leading-loose text-zinc-800"
      >
        Tu compra fue entregada!
      </div>
    </div>
    <div class="inline-flex items-start justify-start self-stretch">
      <img
        class="h-full rounded-bl-lg"
        :src="purchase.item.image.sm.url"
      >
      <div class="inline-flex flex-1 flex-col items-start justify-start self-stretch text-xl">
        <div class="inline-flex flex-1 items-center justify-start gap-2.5 self-stretch border-b border-zinc-500 px-8">
          <div class="font-normal leading-7 text-zinc-800">
            {{ purchase.item.name }}
          </div>
        </div>
        <div class="inline-flex flex-1 items-center justify-start gap-2.5 self-stretch border-b border-zinc-500 px-8">
          <div class="font-normal leading-7 text-zinc-800">
            Total: ${{ purchase.item.price }}
          </div>
        </div>
        <div
          id="buy-div"
          class="inline-flex flex-1 items-center justify-start gap-2.5 self-stretch border-b border-zinc-500 px-8"
        >
          <div class="font-normal leading-7 text-zinc-800">
            Fecha de compra: {{ dateFormat }}
          </div>
        </div>

        <div
          v-if="isDelivered"
          class="inline-flex flex-1 items-center justify-start gap-2.5 self-stretch px-8"
        >
          <div class="font-normal leading-7 text-zinc-800">
            Fecha de entrega: {{ purchase.purchaseDate }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

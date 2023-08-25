<script setup lang="ts">
import { computed, ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import type { Item } from '../api/items';
import purchasesApi from '../api/purchases';

type Props = {
  item: Item
};
const props = defineProps<Props>();

const currencyFormatter = new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' });
const formattedPrice = computed(() => currencyFormatter.format(props.item.price));

const loading = ref(false);
const { notify } = useNotification();
async function buy() {
  loading.value = true;
  try {
    await purchasesApi.create(props.item.id);
    notify({ text: 'Genial, recibimos tu orden! Te contactaremos para coordinar', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}
</script>

<template>
  <div>
    <a
      class="mb-12 inline-flex items-center rounded-full bg-gray-200 py-2 px-4 text-sm font-normal"
      href="/"
    >
      <inline-svg
        class="mr-1 h-4 w-4"
        :src="require('images/return-arrow.svg')"
      />
      Volver
    </a>
    <div class="flex flex-row gap-11">
      <img
        :src="item.image['sm']['url']"
        alt="Product image"
        class="h-80 w-80"
      >

      <div class="flex h-80 w-96 flex-col justify-between">
        <div class="flex flex-col gap-4">
          <h2 class="text-lg font-bold leading-7 text-zinc-800">
            {{ item.name }}
          </h2>
          <h2 class="text-3xl font-normal leading-9 text-zinc-800">
            {{ formattedPrice }}
          </h2>
        </div>
        <p>
          {{ item.description }}
        </p>
        <button
          class="w-full rounded-full bg-blue-800 py-2 px-4 text-lg font-bold text-white"
          :disabled="loading"
          @click="buy"
        >
          Comprar
        </button>
      </div>
    </div>
  </div>
</template>

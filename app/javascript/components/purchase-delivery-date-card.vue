<script setup lang="ts">
import { useNotification } from '@kyvg/vue3-notification';
import { ref } from 'vue';
import baseInput from './base-input.vue';
import purchasesApi from '../api/purchases';
import formatDate from '../utils/date-converter';

type Props = {
  date: Date
  purchaseId: number
};

const props = defineProps<Props>();
const isScheduling = ref(false);
const deliveryDate = ref(new Date());
const loading = ref(false);
const { notify } = useNotification();

const emit = defineEmits<{
  (event: 'updatePurchaseDate', value: Date): void;
}>();

function toggleDate() {
  isScheduling.value = !isScheduling.value;
}
async function updateDate() {
  loading.value = true;
  toggleDate();
  try {
    await purchasesApi.update(props.purchaseId, deliveryDate.value);
    emit('updatePurchaseDate', deliveryDate.value);
    notify({ text: 'Genial, actualizamos la fecha de tu compra', type: 'success' });
  } catch (error) {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    loading.value = false;
  }
}
</script>

<template>
  <div class="inline-flex flex-col items-center justify-start gap-4 text-xl text-zinc-800">
    <div class="self-stretch text-center ">
      <span>
        Tu orden está
      </span>
      <span class="font-bold">
        programada
      </span>
      <span>
        para el:
      </span>
    </div>
    <div class="text-3xl font-medium leading-9">
      {{ dateFormat }}
    </div>
    <div
      v-if="!isScheduling"
      class="inline-flex items-center justify-start gap-4"
    >
      <div class="text-lg font-normal leading-7">
        No puedes ese día?
      </div>
      <button class="flex items-center justify-center gap-1 rounded-lg border border-blue-800 px-4 py-2">
        <div class="text-lg font-medium leading-7 text-blue-800">
          Quiero reagendar
        </div>
      </button>
    </div>
    <div
      v-else
      class="inline-flex w-full flex-col items-center justify-start gap-2.5 bg-neutral-50 p-2.5"
    >
      <div class="text-base font-normal leading-normal text-zinc-800">
        Dinos que día quieres que te entreguemos el producto
      </div>
      <div class="flex h-9 flex-col items-start justify-start">
        <div class="flex h-9 flex-col items-start justify-start gap-1 self-stretch">
          <div class="inline-flex items-start justify-start gap-3 self-stretch rounded-lg border border-zinc-300 bg-white px-3 py-2 shadow">
            <div class="shrink grow basis-0 text-sm font-normal leading-tight text-zinc-300">
              12/12/2022
            </div>
          </div>
        </div>
      </div>
      <div class="inline-flex w-80 items-start justify-start gap-4">
        <button
          class="flex h-11 flex-1 items-center justify-center gap-1 rounded-full px-4 py-2 text-lg font-bold leading-7"
          @click="toggleDate"
        >
          Cancelar
        </button>
        <button
          class="flex h-11 flex-1 items-center justify-center gap-1 rounded-lg bg-blue-800 px-4 py-2 text-lg font-bold leading-7 text-white"
          @click="updateDate"
        >
          Enviar
        </button>
      </div>
    </div>
  </div>
</template>

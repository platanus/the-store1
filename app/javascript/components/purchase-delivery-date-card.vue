<script setup lang="ts">
// import type { DeliveryCompany } from '../api/DeliveryCompany';
// type Props = {
//   // deliveryCompany: DeliveryCompany
// };
// defineProps<Props>();
</script>

<template>
  <div class="inline-flex flex-col items-center justify-start gap-4 text-xl text-zinc-800">
    <div class="self-stretch text-center ">
      <span>
        Tu orden está
      </span>
      <span class="text-xl font-bold">
        programada
      </span>
      <span>
        para el:
      </span>
    </div>
    <div class="text-center text-3xl font-medium leading-9">
      Lunes 12 de diciembre
    </div>
    <div
      v-if="!isSheduling"
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

<script setup lang="ts">

type Props = {
  name: string
  phoneNumber: string
};
defineProps<Props>();
</script>

<template>
  <div class="inline-flex flex-col items-start justify-start rounded-2xl border border-zinc-500 bg-white shadow">
    <div class="inline-flex items-start justify-start gap-2.5 self-stretch border-b border-zinc-500 px-8 py-3">
      <div class="text-center text-2xl font-bold leading-loose text-zinc-800">
        Empresa de despacho
      </div>
    </div>
    <div class="flex h-24 flex-col items-start justify-start gap-4 self-stretch px-8 py-3">
      <div class="text-xl font-medium leading-7 text-zinc-800">
        {{ name }}
      </div>
      <div class="text-lg font-normal leading-7 text-zinc-800">
        {{ phoneNumber }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">

defineEmits(['show-write-review-input']);
</script>

<template>
  <div class="my-8 flex flex-col items-center space-y-2">
    <p class="text-base font-normal leading-normal text-zinc-800">
      Cómo te fue con el producto?
    </p>
    <button
      class="w-full rounded-full border border-blue-800 px-4 py-2 text-lg font-bold text-blue-800"
      @click="$emit('show-write-review-input')"
    >
      Escribir mi opinión
    </button>
  </div>
</template>

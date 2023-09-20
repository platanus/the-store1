<script setup lang="ts">
import { ref } from 'vue';

const body = ref('');
defineEmits(['show-write-review-input', 'create-review']);

</script>

<template>
  <form
    class="my-8 flex flex-col items-center space-y-3 bg-neutral-50 p-2"
    @submit.prevent="$emit('create-review', body)"
  >
    <p>
      Agrega un comentario
    </p>
    <input
      id="body"
      v-model="body"
      type="text"
      class="mt-1 block w-80 rounded-md border border-slate-300 bg-white px-3 py-2 shadow-sm
          placeholder:text-slate-400 focus:border-blue-500 focus:outline-none focus:ring-1
          focus:ring-blue-500 sm:text-sm"
    >
    <div class="flex w-80 gap-2">
      <button
        type="button"
        class="w-full rounded-lg px-4 py-2 text-lg font-bold text-zinc-800"
        @click="$emit('show-write-review-input')"
      >
        Cancelar
      </button>
      <button
        type="submit"
        class="w-full rounded-lg bg-blue-800 px-4 py-2 text-lg font-bold text-white"
      >
        Enviar
      </button>
    </div>
  </form>
</template>

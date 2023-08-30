<script setup lang="ts">
type Props = {
  redirectUrl: string
};
defineProps<Props>();
</script>

<template>
  <a
    class="inline-flex h-9 w-24 items-center justify-center gap-1 rounded-full bg-zinc-100 px-4 py-2 hover:bg-zinc-200 focus:outline-none"
    :href="redirectUrl"
  >
    <div class="relative h-4 w-4">
      <inline-svg
        :src="require('images/return-arrow.svg')"
        alt="row"
      />
    </div>
    <div class="text-sm font-normal leading-tight text-zinc-800">
      Volver
    </div>
  </a>
</template>

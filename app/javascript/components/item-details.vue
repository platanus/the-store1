<script setup lang="ts">
import { computed, ref } from 'vue';
import { useNotification } from '@kyvg/vue3-notification';
import type { Item } from '../api/items';
import purchasesApi from '../api/purchases';
import itemReviewCard from './item-review-card.vue';
import reviewApi, { type Review } from '../api/reviews';
import ItemNewReviewSection from './item-new-review-section.vue';
import ItemReviewForm from './item-review-form.vue';

type Props = {
  item: Item
  reviews: Review[]
};

const props = defineProps<Props>();
const currencyFormatter = new Intl.NumberFormat('es-CL', { style: 'currency', currency: 'CLP' });
const formattedPrice = computed(() => currencyFormatter.format(props.item.price));
const showingWriteReviewInput = ref(false);
const updatedReviews = ref(props.reviews);
const { notify } = useNotification();
const loading = ref(false);

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

async function createReview(body: string) {
  try {
    const response = await reviewApi.create(props.item.id, body);
    updatedReviews.value.unshift(response);
  } catch {
    notify({ text: 'Ups, ocurrió un error! Inténtalo de nuevo', type: 'error' });
  } finally {
    showingWriteReviewInput.value = false;
  }
}

</script>

<template>
  <div>
    <a
      class="inline-flex items-center rounded-full bg-gray-200 px-4 py-2 text-sm font-normal"
      href="/"
    >
      <inline-svg
        class="mr-1 h-4 w-4"
        :src="require('images/return-arrow.svg')"
      />
      Volver
    </a>
    <div class="my-12 flex flex-row gap-11">
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
          class="w-full rounded-full bg-blue-800 px-4 py-2 text-lg font-bold text-white"
          :disabled="loading"
          @click="buy"
        >
          Comprar
        </button>
      </div>
    </div>

    <div
      class="mb-8 border-b border-zinc-800"
    >
      <h2 class="text-xl font-bold text-zinc-800">
        Opiniones del producto
      </h2>
      <item-review-form
        v-if="showingWriteReviewInput"
        :item-id="item.id"
        @show-write-review-input="showingWriteReviewInput = false"
        @create-review="createReview($event)"
      />
      <item-new-review-section
        v-else
        @show-write-review-input="showingWriteReviewInput = true"
      />
    </div>

    <div
      v-if="updatedReviews.length > 0"
      class="mx-auto flex flex-col"
    >
      <item-review-card
        v-for="review in updatedReviews"
        :key="review.id"
        :review="review"
      />
    </div>
    <p
      v-else
      class="text-center text-base text-zinc-800"
    >
      No hay reseñas para este producto. Sé el primero!
    </p>
  </div>
</template>

import api from './index';
import type { User } from './users';

export interface Review {
  id: number;
  comment: string;
  user: User;
  createdAt: string;
}

export default {
  create(itemId: number, comment: string) {
    const path = `/api/internal/items/${itemId}/reviews`;

    return api({
      method: 'post',
      url: path,
      data: {
        review: { comment, itemId },
      },
    }).then(response => response.data.review as Review);
  },
};

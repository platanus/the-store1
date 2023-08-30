import api from './index';
import type { User } from './users';
import type { Item } from './items';
import type { DeliveryCompany } from './delivery_company';

export interface Purchase {
  id: number;
  status: 'pending' | 'delivered';
  user: User;
  item: Item;
  createdAt: string
  purchaseDate: string;
  deliveryCompany: DeliveryCompany
}

export default {
  create(itemId: number) {
    const path = '/api/internal/purchases';

    return api({
      method: 'post',
      url: path,
      data: {
        purchase: { itemId },
      },
    });
  },
};

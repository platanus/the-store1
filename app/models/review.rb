class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :comment, presence: true
end

# == Schema Information
#
# Table name: reviews
#
#  id         :bigint(8)        not null, primary key
#  comment    :string           not null
#  item_id    :bigint(8)        not null
#  user_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reviews_on_item_id  (item_id)
#  index_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (user_id => users.id)
#

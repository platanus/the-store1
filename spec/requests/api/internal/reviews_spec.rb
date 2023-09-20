require 'rails_helper'

RSpec.describe 'Api::Internal::ReviewsControllers', type: :request do
  let(:user) { create(:user) }

  describe 'POST /create' do
    let(:item) { create(:item) }
    let(:item_id) { item.id.to_s }
    let(:params) do
      {
        review: {
          user_id: user.id,
          item_id: item.id,
          comment: 'test'
        }
      }
    end

    let(:attributes) do
      JSON.parse(response.body)['review'].symbolize_keys
    end

    def perform
      post "/api/internal/items/#{item_id}/reviews", params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it 'creates a review' do
        expect(Review.count).to eq(1)
      end

      it { expect(attributes[:comment]).to eq('test') }
      it { expect(attributes[:user]["id"]).to eq(user.id) }
      it { expect(attributes[:created_at]).to be_present }
      it { expect(response.status).to eq(201) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end
end

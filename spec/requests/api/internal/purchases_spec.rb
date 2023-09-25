require 'rails_helper'

RSpec.describe 'Api::Internal::PurchasesControllers', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    let!(:purchases) { create_list(:purchase, 5, user: user) }
    let(:collection) { JSON.parse(response.body)['purchases'] }
    let(:params) { {} }

    def perform
      get '/api/internal/purchases', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(5) }
      it { expect(response.status).to eq(200) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end

  describe 'POST /create' do
    let(:item) { create(:item) }
    let(:params) do
      {
        purchase: {
          user_id: user.id,
          item_id: item.id
        }
      }
    end

    let(:attributes) do
      JSON.parse(response.body)['purchase'].symbolize_keys
    end

    def perform
      post '/api/internal/purchases', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it 'creates a purchase' do
        expect(Purchase.count).to eq(1)
      end

      it { expect(attributes[:item]["id"]).to eq(item.id) }
      it { expect(attributes[:user]["id"]).to eq(user.id) }
      it { expect(response.status).to eq(201) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end

  describe 'GET /show' do
    let(:purchase) { create(:purchase, user: user) }
    let(:other_purchase) { create(:purchase) }
    let(:purchase_id) { purchase.id.to_s }

    let(:attributes) do
      JSON.parse(response.body)['purchase'].symbolize_keys
    end

    def perform
      get "/api/internal/purchases/#{purchase_id}"
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it { expect(response.status).to eq(200) }

      context 'with resource not owned by user' do
        let(:purchase_id) { other_purchase.id.to_s }

        it { expect(response.status).to eq(404) }
      end

      context 'with resource not found' do
        let(:purchase_id) { '666' }

        it { expect(response.status).to eq(404) }
      end
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }

      context 'with resource not found' do
        let(:purchase_id) { '666' }

        it { expect(response.status).to eq(401) }
      end
    end
  end

  describe 'PUT /update' do
    let(:purchase) { create(:purchase, user: user) }
    let(:purchase_id) { purchase.id }
    let(:updated_attributes) { { purchase_date: Date.new(2023, 9, 5) } }

    def perform
      put "/api/internal/purchases/#{purchase_id}", params: { purchase: updated_attributes }
    end

    def perform_with_invalid_attributes
      put "/api/internal/purchases/#{purchase_id}", params: { force_error: true }
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it 'updates the purchase' do
        purchase.reload
        expect(purchase.purchase_date).to eq(Date.new(2023, 9, 5))
      end

      it { expect(response.status).to eq(200) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end

    context 'when update fails' do
      before do
        sign_in(user)
        allow(purchase).to receive(:update!).and_raise(ActiveRecord::RecordInvalid)
        perform_with_invalid_attributes
      end

      it { expect(response.status).to eq(500) }
    end
  end
end

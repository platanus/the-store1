require 'rails_helper'

RSpec.describe DeliveryCompany, type: :model do
  context 'with valid attributes' do
    it { expect(build(:item)).to be_valid }
  end

  describe 'validations' do
    it { is_expected.to allow_value(nil, 'Nombre').for(:name) }
    it { is_expected.to allow_value(nil, 'PhoneNumber').for(:phone_number) }
  end
end

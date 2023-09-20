require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'with valid attributes' do
    it { expect(build(:review)).to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:comment) }
  end
end

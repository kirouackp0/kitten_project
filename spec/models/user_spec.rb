require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'associations' do
    it { should have_one(:cart) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'user creation' do
    it 'automatically creates a cart for user' do
      expect(user.cart).not_to be_nil
    end
  end
end

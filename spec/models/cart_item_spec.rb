require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart_item) { create(:cart_item) }

  context "validations" do
    it "should have a default quantity of 1" do
      cart_item = create(:cart_item)
      expect(cart_item.quantity).to eq(1)
    end

    it "should allow setting a custom quantity" do
      cart_item = create(:cart_item, quantity: 3)
      expect(cart_item.quantity).to eq(3)
    end
  end
end

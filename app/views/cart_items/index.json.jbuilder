# frozen_string_literal: true

json.array! @cart_items, partial: 'cart_items/cart_item', as: :cart_item

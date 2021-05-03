require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  describe 'Validations' do

    it "product will be save to database" do
      category = Category.create(name: "Urukhai")
      product = Product.create(name: "leather shoes", price: 12345, quantity: 1, category: category)
      expect(product).to be_present
    end

    it "doesn't save if name is missing" do
      category = Category.create(name: "Urukhai")
      product = Product.create(name: nil, price: 12345, quantity: 1, category: category)
      expect(product.errors.full_messages).to include "Name can't be blank"
    end

    it "doesn't save if price is missing" do
      category = Category.create(name: "Urukhai")
      product = Product.create(name:"leather shoes", price: nil, quantity: 1, category: category)
      expect(product.errors.full_messages). to include "Price can't be blank"
    end
    it "doesn't save if quantity is missing" do
      category = Category.create(name: "Urukhai")
      product = Product.create(name:"leather shoes", price: 12345, quantity: nil, category: category)
      expect(product.errors.full_messages). to include "Quantity can't be blank"
    end
    it "doesn't save if category is missing" do
      category = Category.create(name: "Urukhai")
      product = Product.create(name:"leather shoes", price: 12345, quantity: 1, category: nil)
      expect(product.errors.full_messages). to include "Category can't be blank"
    end
  end
end

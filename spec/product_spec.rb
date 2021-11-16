require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    describe 'Validate' do
  
      it "validates if name is present in product" do
        @product = Product.new
        @product.name = nil 
        @product.valid?
        expect(@product.errors[:name]).to  include("can't be blank")
    
        @product.name = 'test' 
        @product.valid? 
        expect(@product.errors[:name]).not_to  include("can't be blank")
      end
  
      it "validates if price_cents is present in product" do
        @product = Product.new
        @product.price_cents = nil 
        @product.valid?
        expect(@product.errors[:price_cents]).to  include("is not a number")
    
        @product.price_cents = 12311 # valid state
        @product.valid? 
        expect(@product.errors[:price_cents]).not_to  include("can't be blank")
      end
    
      it "validates if quantity is present in product" do
        @product = Product.new
        @product.quantity = nil # invalid state
        @product.valid?
        expect(@product.errors[:quantity]).to  include("can't be blank")
    
        @product.quantity = 3 # valid state
        @product.valid? 
        expect(@product.errors[:quantity]).not_to  include("can't be blank")
      end
    
      it "validates if category id is present in product" do
        @category = Category.new
        @product = Product.new
        @product.category = nil # invalid state
        @product.valid?
        expect(@product.errors[:category]).to  include("can't be blank")
  
        @product.category = @category # valid state
        @product.valid? 
        expect(@product.errors[:category]).not_to  include("can't be blank")
      end
    end
  end
end
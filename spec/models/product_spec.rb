require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

    describe 'Validations' do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:price) }
    # it { is_expected.to validate_presence_of(:quantity) }
    # it { is_expected.to validate_presence_of(:category) }

    it "should have all four validations" do
        @category = Category.new
        product = Product.new(
          name: "abc",
          price: 1,
          quantity: 1,
          category: @category
        )
      expect(product).to be_valid
    end

    it "is not valid without a name" do
        @category = Category.new
        product = Product.new(
          name: nil,
          price: 1,
          quantity: 1,
          category: @category
        )
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
        @category = Category.new
        product = Product.new(
          name: "abc",
          price: nil,
          quantity: 1,
          category: @category
        )
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
        @category = Category.new
        product = Product.new(
          name: "abc",
          price: 1,
          quantity: nil,
          category: @category
        )
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
        @category = Category.new
        product = Product.new(
          name: "abc",
          price: 1,
          quantity: 1,
          category: nil
        )
      expect(product).to_not be_valid
    end


  end


end

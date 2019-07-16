require 'rails_helper'

# RSpec.feature "AddToCarts", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do


 before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Can add product/s to cart" do
  
    visit root_path

    first('.btn-primary').click

    expect(page).to have_text'My Cart (1)'

    save_screenshot "add_product_to_cart.png"

  end

end

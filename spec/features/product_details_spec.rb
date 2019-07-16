require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
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

  # Equivalent to the "it" block -> the "scenario"
  scenario "Can navigate from homepage to product page by clicking on a product" do
    # ACT
    visit root_path

    # product_el = page.find('article.product:first-child')
    # product_header = product_el.find('header h4')
    # product_name = product_header.text
    # product_header.click


    first('.btn-default').click

    
    # expect(page).to have_css 'article.product:first-child.description'
    expect(page).to have_css('section.products-show')
        # expect(page).to have_css('products-show')

    sleep 2
    save_screenshot "product_image_again.png"

    # detail_header = page.find('header.page-header h1').text
    # expect(detail_header).to end_with(product_name)

       # DEBUG / VERIFY
    

  end

end




require 'rails_helper'

RSpec.describe Api::ShopsController, type: :controller do
  before(:all) do
    @shop = create :shop

    book = create :book
    create :books_shop, book: book, shop: @shop, copies_in_stock: 0
    book2 = create :book
    create :books_shop, book: book2, shop: @shop
  end

  it 'shows shop with books marked as sold' do
    get :show, params: { id: @shop.id }

    expect(response.status).to eq(200)
    expect(json[:shop][:books_in_stock].count).to eq(2)
    expect(json[:shop][:books_in_stock].first[:sold]).to eq(true)
    expect(json[:shop][:books_in_stock].last[:sold]).to eq(false)
  end

  private

  def json
    JSON.parse(response.body).deep_symbolize_keys
  end
end

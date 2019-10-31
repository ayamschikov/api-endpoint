require 'rails_helper'

RSpec.describe Api::PublishersController, type: :controller do
  before(:all) do
    @publisher = create(:publisher)
  end

  it 'shows shops with books' do
    book = create :book, publisher: @publisher
    shop = create :shop, books_sold_count: 10
    create :books_shop, book: book, shop: shop, copies_in_stock: 3
    shop2 = create :shop
    create :books_shop, book: book, shop: shop2

    get :show, params: { id: @publisher.id }

    expect(response.status).to eq(200)
    expect(json[:publisher][:shops].count).to eq(2)
    expect(json[:publisher][:shops].first[:books_sold_count]).to eq(10)
    expect(json[:publisher][:shops].first[:books_in_stock].first[:id]).to eq(book.id)
    expect(json[:publisher][:shops].first[:books_in_stock].first[:copies_in_stock]).to eq(3)
  end

  private

  def json
    JSON.parse(response.body).deep_symbolize_keys
  end
end

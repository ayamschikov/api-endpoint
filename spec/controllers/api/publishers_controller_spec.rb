require 'rails_helper'

RSpec.describe Api::PublishersController, type: :controller do
  before(:all) do
    @publisher = create(:publisher)

    @book = create :book, publisher: @publisher
    @shop = create :shop, books_sold_count: 10
    @books_shop = create :books_shop, book: @book, shop: @shop, copies_in_stock: 3
  end

  it 'shows shops with books' do
    get :show, params: { id: @publisher.id }

    expect(response.status).to eq(200)
    expect(json[:publisher][:shops].count).to eq(1)
    expect(json[:publisher][:shops].first[:books_sold_count]).to eq(@shop.books_sold_count)
    expect(json[:publisher][:shops].first[:books_in_stock].first[:id]).to eq(@book.id)
    expect(json[:publisher][:shops].first[:books_in_stock].first[:copies_in_stock]).to eq(@books_shop.copies_in_stock)
  end

  it 'shows shops ordered by sold books count' do
    shop2 = create :shop, books_sold_count: 30
    create :books_shop, book: @book, shop: shop2

    get :show, params: { id: @publisher.id }

    expect(response.status).to eq(200)
    expect(json[:publisher][:shops].count).to eq(2)
    expect(json[:publisher][:shops].first[:id]).to eq(shop2.id)
    expect(json[:publisher][:shops].last[:id]).to eq(@shop.id)
  end

  private

  def json
    JSON.parse(response.body).deep_symbolize_keys
  end
end

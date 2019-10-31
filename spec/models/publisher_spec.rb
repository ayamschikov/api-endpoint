require 'rails_helper'

RSpec.describe Publisher, type: :model do
  before(:all) do
    @publisher = create(:publisher)
  end

  it 'creates new publisher' do
    expect(@publisher.persisted?).to eq(true)
  end
  it 'is valid with valid attributes' do
    expect(@publisher).to be_valid
  end

  it 'is not valid without a title' do
    publisher = build(:publisher, title: nil)
    expect(publisher).to_not be_valid
  end

  it 'associates with book' do
    create :book, publisher: @publisher

    expect(@publisher.books.count).to eq(1)
  end

  it 'returns shop through book' do
    book = create :book, publisher: @publisher
    shop = create :shop
    create :books_shop, book: book, shop: shop
    shop2 = create :shop
    create :books_shop, book: book, shop: shop2

    expect(@publisher.shops.first).to eq(shop)
    expect(@publisher.shops.last).to eq(shop2)
  end
end

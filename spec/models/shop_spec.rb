require 'rails_helper'

RSpec.describe Shop, type: :model do
  before(:all) do
    @shop = create(:shop)
  end

  it 'creates new shop' do
    expect(@shop.persisted?).to eq(true)
  end
  it 'is valid with valid attributes' do
    expect(@shop).to be_valid
  end

  it 'is not valid without a name' do
    shop = build(:shop, name: nil)
    expect(shop).to_not be_valid
  end

  it 'associates with book' do
    book = create :book
    @shop.books << book
    expect(@shop.books.count).to eq(1)
  end
end

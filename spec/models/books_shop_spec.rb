require 'rails_helper'

RSpec.describe BooksShop, type: :model do
  before(:all) do
    @books_shop = create(:books_shop)
  end

  it 'creates new books_shop' do
    expect(@books_shop.persisted?).to eq(true)
  end
  it 'is valid with valid attributes' do
    expect(@books_shop).to be_valid
  end
end

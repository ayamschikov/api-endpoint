require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:all) do
    @book = create(:book)
  end

  it 'creates new book' do
    expect(@book.persisted?).to eq(true)
  end
  it 'is valid with valid attributes' do
    expect(@book).to be_valid
  end

  it 'is not valid without a title' do
    book = build(:book, title: nil)
    expect(book).to_not be_valid
  end

  it 'is not valid without a publisher' do
    book = build(:book, publisher: nil)
    expect(book).to_not be_valid
  end
end

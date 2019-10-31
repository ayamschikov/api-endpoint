class BookSerializer < ActiveModel::Serializer
  attributes %i[id title]

  attribute :copies_in_stock do
    book_copies_count
  end

  attribute :sold do
    book_copies_count.positive? ? false : true
  end

  private

  def book_copies_count
    object.books_shops.find_by(shop: @instance_options[:shop_id]).copies_in_stock
  end
end

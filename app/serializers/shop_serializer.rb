class ShopSerializer < ActiveModel::Serializer
  attributes %i[id name books_sold_count]

  attribute :books_in_stock do
    object.books.map do |b|
      BookSerializer.new(b, shop_id: object.id)
    end
  end
end

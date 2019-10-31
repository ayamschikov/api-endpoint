class BookSerializer < ActiveModel::Serializer
  attributes %i[id title]

  attribute :copies_in_stock do
    object.books_shops.find_by(shop: @instance_options[:shop_id]).copies_in_stock
  end
end

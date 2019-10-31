class PublisherShowSerializer < ActiveModel::Serializer
  has_many :shops, serializer: ShopSerializer, key: :shops

  def shops
    object.shops.order(books_sold_count: :desc)
  end
end

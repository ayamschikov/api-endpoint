class PublisherShowSerializer < ActiveModel::Serializer
  has_many :shops, serializer: ShopSerializer, key: :shops
end

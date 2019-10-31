class Api::ShopsController < ApplicationController
  def show
    shop = Shop.includes(:books).find(params[:id])

    serialized_shop = ActiveModelSerializers::SerializableResource.new(shop, each_serializer: ShopShowSerializer).as_json
    render json: serialized_shop
  end
end

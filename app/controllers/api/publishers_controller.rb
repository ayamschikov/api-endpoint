class Api::PublishersController < ApplicationController
  def show
    publisher = Publisher.includes(:shops, :books).find(params[:id])

    serialized_publisher = ActiveModelSerializers::SerializableResource.new(publisher, each_serializer: PublisherShowSerializer).as_json
    render json: serialized_publisher
  end
end

class Api::V1::PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render json: @properties, each_serializer: PropertySerializer
  end

  def show
    @property = Property.find(params[:id])
    render json: @property, serializer: PropertySerializer
  end

  def create
    @property = Property.new(strong_params)

    if @property.save
      render json: @property, serializer: PropertySerializer
    else
      render json: @property, status: :unprocessable_entity
    end
  end

  def update
    @property = Property.find(params[:id])

    if @property.update_attributes(strong_params)
      render json: @property, serializer: PropertySerializer
    else
      render json: @property, status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    render json: {success: 'Successfully deleted'}, status: :ok
  end

private
  def strong_params
    params.require(:property).permit(:name, :slug, :amount, :bedrooms, :bathrooms, :sqft)
  end
end

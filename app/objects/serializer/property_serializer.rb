class PropertySerializer < ActiveModel::Serializer
  root :property
  attributes :id, :name, :slug, :amount, :bedrooms, :bathrooms, :sqft
end

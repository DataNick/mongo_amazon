class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :price_in_cents, type: Integer
end

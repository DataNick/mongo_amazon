class Category
  include Mongoid::Document
  field :name, type: String

  embedded_in :product
end

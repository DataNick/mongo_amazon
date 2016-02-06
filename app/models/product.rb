class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :price_in_cents, type: Integer

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  embeds_many :reviews
  belongs_to :category
end

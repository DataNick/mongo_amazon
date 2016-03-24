class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :price_in_cents, type: Integer

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}
  #has_many users, through: :reviews
  has_many :reviews
  embeds_one :category
  # embeds_many :reviews

  def users
    User.in(id: reviews.pluck(:user_id))
  end
end

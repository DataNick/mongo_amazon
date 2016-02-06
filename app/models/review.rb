class Review
  include Mongoid::Document
  field :comment, type: String

  validates :comment, :presence => true

  embedded_in :product, inverse_of: :reviews
  belongs_to :user
end

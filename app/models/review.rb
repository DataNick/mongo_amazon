class Review
  include Mongoid::Document
  field :comment, type: String

  embedded_in :product, inverse_of: :reviews
  belongs_to :user
end

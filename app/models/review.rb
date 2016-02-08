class Review
  include Mongoid::Document
  field :comment, type: String

  validates :comment, :presence => true

  belongs_to :user
  belongs_to :product
end

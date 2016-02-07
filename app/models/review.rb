class Review
  include Mongoid::Document
  field :comment, type: String

  validates :comment, :presence => true

  belongs_to :user, foreign_key: :author_id
  belongs_to :product
end

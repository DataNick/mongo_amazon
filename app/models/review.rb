class Review
  include Mongoid::Document
  field :comment, type: String
  field :user_id, type: BSON::ObjectId

  validates :comment, :presence => true

  belongs_to :user
  embedded_in :product

end

class Product
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, type: String
  field :description, type: String
  field :price_in_cents, type: Integer

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  has_mongoid_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  embeds_many :reviews
  embeds_one :category


  def users
    User.in(id: reviews.pluck(:user_id))
  end
end

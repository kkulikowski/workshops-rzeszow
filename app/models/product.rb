class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :description, :title, :price
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating).round(2)
    end
  end
end

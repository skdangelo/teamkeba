class Program < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :enrollments
  geocoded_by :address
  after_validation :geocode
  
  validates :title, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end

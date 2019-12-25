class Film < ApplicationRecord
  has_many :seances
  has_many :comments
  mount_uploader :image, ImageUploader
end

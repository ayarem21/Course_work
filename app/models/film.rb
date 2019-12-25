class Film < ApplicationRecord
  has_many :seances, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end

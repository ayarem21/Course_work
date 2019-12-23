class Film < ApplicationRecord
  has_many :seances

  mount_uploader :image, ImageUploader
end

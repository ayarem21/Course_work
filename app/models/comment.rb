class Comment < ApplicationRecord
  belongs_to :film, dependent: :destroy
end

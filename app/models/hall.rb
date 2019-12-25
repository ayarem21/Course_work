class Hall < ApplicationRecord
  has_many :films, dependent: :destroy
end

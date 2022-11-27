class House < ApplicationRecord
  has_many :appointments
  has_one_attached :image
end

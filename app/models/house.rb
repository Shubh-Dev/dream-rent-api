class House < ApplicationRecord
  has_many :appointments
  has_one_attached :image

  validates :address, presence: true
  validates :house_type, presence: true
  validates :rooms, presence: true
end

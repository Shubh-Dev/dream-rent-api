class House < ApplicationRecord
  has_many :appointments

  validates :address, presence: true
  validates :house_type, presence: true
  validates :rooms, presence: true
  validates :balcony, presence: true
  validates :size, presence: true
end

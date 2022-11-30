class House < ApplicationRecord
  has_many :appointments
  has_one_attached :image

  validate :check_file_presence

  def check_file_presence
    errors.add(:image, 'no image added') unless image.attached?
  end
end

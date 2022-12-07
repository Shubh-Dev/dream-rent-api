FactoryBot.define do
  factory :house do
    address { 'Hollywood, California' }
    house_type { 'Condo' }
    rooms { 4 }
    balcony { true }
    size { 5000 }
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(name: "John Doe")
house = House.create!(rooms: 4, address: "California, South", house_type: "apartment", balcony: true, size: 500)
appointment = Appointment.create!(date: "2021-05-05", time: "12:00", visitors: 3, user_id: user.id, house_id: house.id)
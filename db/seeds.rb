# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Student.destroy_all
Teacher.destroy_all

r = Random.new

gender_array = ["male", "female", "transgender", "other"]
shirt_size = ["xs", "s", "m", "l", "xl"]
allergy_array = ["peanuts", "eggs", "lactose"]

10.times do
    Teacher.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        avatar: File.new("#{Rails.root}/public/capybara.jpg"),
        password: "password",
        school_key: "go demogorgons",
        email: Faker::Internet.email
        )
end

300.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    grade_level: r.rand(6..8),
    gender: gender_array[r.rand(gender_array.length)],
    gpa: r.rand(4.0).round(2),
    detention_count: r.rand(10),
    shirt_size: shirt_size[r.rand(shirt_size.length)],
    food_allergies: allergy_array[r.rand(allergy_array.length)..r.rand(allergy_array.length)],
    mentor: Teacher.all.sample
    )
end

require 'faker'
require 'csv'




def make_n_new_students(n = 300)
  filename = ARGV[0]
  gender_array = ["male", "female", "transgender", "other"]
  shirt_size = ["xs", "s", "m", "l", "xl"]
  allergy_array = ["peanuts", "eggs", "lactose"]
  r = Random.new

  student_data = (0..300).to_a.map do |ind|
    [Faker::Name.first_name, Faker::Name.last_name, r.rand(6..8), gender_array.sample, r.rand(4.0).round(2), r.rand(10), shirt_size.sample, allergy_array.sample(r.rand(allergy_array.length)).join(" ")]
  end

  CSV.open(filename, "wb") do |csv|
    csv << ["first_name", "last_name", "grade_level", "gender", "gpa", "detention_count", "shirt_size", "food_allergies"]
    student_data.each { |sd| csv << sd }
  end
end

make_n_new_students(ARGV[1])
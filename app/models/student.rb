class Student < ApplicationRecord
  serialize :food_allergies, Array

  def self.sort_alphabetically_by_last_name
    Student.order(last_name: :asc)
  end

end

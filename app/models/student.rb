class Student < ApplicationRecord
  belongs_to :mentor, class_name: :Teacher

  validates_presence_of :first_name, :last_name, :grade_level, :gender, :gpa, :mentor_id

  serialize :food_allergies, Array

  def self.sort_alphabetically_by_last_name
    Student.order(last_name: :asc)
  end

  def full_name
    [first_name, last_name].join(" ")
  end

end

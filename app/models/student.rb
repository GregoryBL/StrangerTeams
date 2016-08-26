class Student < ApplicationRecord
  belongs_to :mentor, class_name: :Teacher, optional: true

  validates_presence_of :first_name, :last_name, :grade_level, :gender, :gpa

  def self.sort_alphabetically_by_last_name
    self.sort_by_fields("last_name", "asc")
  end

  def self.sort_by_fields(attribute, order_direction)
    Student.order("#{attribute}":  :"#{order_direction}")
  end

  def full_name
    [first_name, last_name].join(" ")
  end

end

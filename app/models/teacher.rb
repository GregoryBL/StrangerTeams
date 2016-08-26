class Teacher < ApplicationRecord
  has_many :students, foreign_key: :mentor_id

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validate :school_key_is_correct, on: :create

  before_destroy :clear_self_from_students_mentor

  def school_key=(user_key)
    @school_key = user_key
  end

  def school_key
    @school_key ||= ""
  end

  def school_key_is_correct
    if school_key.downcase == "i am the demogorgon"
      self.admin = true
    else
      errors.add(@school_key, "is not the correct school key") unless school_key.downcase == "go demogorgons"
    end
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def self.sort_alphabetically_by_last_name
    Teacher.order(last_name: :asc)
  end

  def clear_self_from_students_mentor
    students.each do |student|
      student.mentor_id = nil
      student.save
    end
  end
end

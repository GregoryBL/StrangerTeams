class Teacher < ApplicationRecord
  has_many :students, foreign_key: :mentor_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :school_key_is_correct, on: :create

  def school_key=(user_key)
    @school_key = user_key
  end

  def school_key
    @school_key ||= ""
  end

  def school_key_is_correct
    errors.add(@school_key, "is not the correct school key") unless school_key.downcase == "go demogorgons"
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end

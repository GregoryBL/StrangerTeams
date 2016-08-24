class Student < ApplicationRecord
  serialize :food_allergies, Array
end

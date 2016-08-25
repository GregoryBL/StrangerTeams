class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string   :first_name, null: false
      t.string   :last_name, null: false
      t.string   :grade_level, null: false
      t.string   :gender, null: false
      t.string   :gpa, null: false
      t.integer  :detention_count, default: 0
      t.string   :shirt_size
      t.string   :food_allergies
      t.integer  :mentor_id

      t.timestamps
    end
  end
end
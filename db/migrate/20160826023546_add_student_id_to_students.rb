class AddStudentIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :student_id, :string
    add_index :students, :student_id, :unique => true
  end
end

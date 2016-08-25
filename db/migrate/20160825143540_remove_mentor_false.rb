class RemoveMentorFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :students, :mentor_id, :integer, null: true
  end
end

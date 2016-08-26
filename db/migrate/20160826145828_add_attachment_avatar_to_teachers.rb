class AddAttachmentAvatarToTeachers < ActiveRecord::Migration
  def self.up
    change_table :teachers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :teachers, :avatar
  end
end

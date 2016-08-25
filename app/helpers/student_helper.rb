module StudentHelper
  def unassigned?(student)
    student.mentor_id != current_teacher || student.mentor_id == nil
  end
end

module StudentHelper
  def not_assigned?(student)
    student.mentor_id != current_teacher.id
  end
end

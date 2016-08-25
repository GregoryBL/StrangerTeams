module StudentHelper
  def not_assigned?(student)
    student.mentor_id == nil
  end

  def my_student?(student)
    student.mentor_id == current_teacher.id
  end
end

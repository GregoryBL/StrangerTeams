module TeacherHelper
  def is_admin?
    current_teacher.admin == true if current_teacher
  end
end

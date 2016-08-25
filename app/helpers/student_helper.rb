module StudentHelper
  def not_assigned?(student)
    student.mentor_id != current_teacher.id
  end

  def color_indicate_gpa_range(student)
    gpa = student.gpa.to_i
    if  gpa >= 3.0
      'safe-grade-range'
    elsif gpa >= 2.0
      'warning-grade-range'
    else
      'danger-grade-range'
    end
  end
end

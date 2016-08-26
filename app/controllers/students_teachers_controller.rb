class StudentsTeachersController < ApplicationController
  def update
    @student = Student.find(params[:student_id])
    @teacher = Teacher.find(params[:id])
    @student.update_attributes(mentor: @teacher)
    if request.xhr?
      render partial: "/students/student_table_row", locals: { student: @student }
    else
      redirect_to @teacher
    end
  end

  def remove
    @student = Student.find(params[:student_id])
    @teacher = Teacher.find(params[:id])
    @student.update_attributes(mentor: nil)
    if request.xhr?
      render partial: "/students/student_table_row", locals: { student: @student }
    else
      redirect_to @teacher
    end
  end
end

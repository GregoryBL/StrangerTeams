class StudentsTeachersController < ApplicationController
  def update
    @student = Student.find(params[:student_id])
    @teacher = Teacher.find(params[:id])
    @student.update_attributes(mentor: @teacher)
    redirect_to @teacher
  end

  def remove
    @student = Student.find(params[:student_id])
    @teacher = Teacher.find(params[:id])
    @student.update_attributes(mentor: nil)
    redirect_to @teacher
  end

end

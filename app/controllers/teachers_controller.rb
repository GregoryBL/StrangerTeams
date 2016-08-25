class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students
  end
end

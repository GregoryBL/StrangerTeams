class TeachersController < ApplicationController
  def show
    @teacher = Teacher.find(params[:id])
    # TO DO! Uncomment line 5
    # @students = @teacher.students
  end
end

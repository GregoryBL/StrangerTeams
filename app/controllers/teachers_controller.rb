class TeachersController < ApplicationController
  def index
    @teachers = Teacher.sort_alphabetically_by_last_name
  end

  def show
    @teacher = Teacher.find(params[:id])
    # TO DO! Uncomment line 5
    # @students = @teacher.students
  end
end

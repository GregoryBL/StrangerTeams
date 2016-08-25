class TeachersController < ApplicationController

  before_action :authenticate_teacher!

  def index
    @teachers = Teacher.sort_alphabetically_by_last_name
  end

  def show
    @teacher = Teacher.find(params[:id])
    # TO DO! Uncomment line 5
    # @students = @teacher.students
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    sign_out current_teacher if @teacher == current_teacher
    @teacher.destroy if @teacher
    redirect_to '/teachers'
  end
end

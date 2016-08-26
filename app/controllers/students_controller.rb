require 'csv'

class StudentsController < ApplicationController

  before_action :authenticate_teacher!

  def index # call method to sort students alphabetically
    # if request.xhr?
    #   if params[:alphabetically]
    #     @student_paginate = Student.paginate(:page => params[:page], :per_page => 25).sort_alphabetically_by_last_name
    #   else
    #     @student_paginate = Student.paginate(:page => params[:page], :per_page => 25).sort_by_fields(params[:attr], params[:order_direction])
    #   end
    # else
      if params[:attr] != "alphabetically"
        @student_paginate = Student.paginate(:page => params[:page], :per_page => 25).sort_by_fields(params[:attr], params[:order_direction])
      else
        @student_paginate = Student.paginate(:page => params[:page], :per_page => 25).sort_alphabetically_by_last_name
      end
    # end
  end

  def show # show individual student
    @student = Student.find(params[:id])
  end

  def new # get new student form
    @student = Student.new
  end

  def create # post new student
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      @errors = @student.errors.full_messages
      render 'new'
    end
  end

  def edit # get edit form
    @student = Student.find(params[:id])
  end

  def update #put student data
    @student = Student.find(params[:id])

    if @student.update_attributes(student_params)
      redirect_to @student
    else
      @errors = @student.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student != nil
      @student.destroy
    end
    redirect_to students_path
  end

  def import
  end

  def create_multiple
    CSV.foreach(params[:student_csv_file][:attachment].path, headers: true) do |row|
      student = Student.find_or_create_by!(row.to_hash)
    end
    redirect_to students_path
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :grade_level, :gender, :gpa, :detention_count, :shirt_size, :food_allergies, :mentor_id)
  end

  def extension_white_list
    %w(csv)
  end
end

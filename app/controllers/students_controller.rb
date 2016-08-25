require 'csv'

class StudentsController < ApplicationController

  def index # call method to sort students alphabetically
    @student_paginate = Student.paginate(:page => params[:page], :per_page => 50).sort_alphabetically_by_last_name
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

    if @student = Student.update(student_params)
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
      param_hash = row.to_hash
      param_hash["food_allergies"] = param_hash["food_allergies"].split(" ") if param_hash["food_allergies"]
      p param_hash
      student = Student.create!(param_hash)
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

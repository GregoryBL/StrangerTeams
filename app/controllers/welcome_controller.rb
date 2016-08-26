class WelcomeController < ApplicationController
  before_action :authenticate_teacher!

  def index # call method to sort students alphabetically
    @student_paginate = Student.paginate(:page => params[:page], :per_page => 25).sort_alphabetically_by_last_name
  end
end

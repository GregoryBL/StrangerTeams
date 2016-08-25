class WelcomeController < ApplicationController
  def index
     @students = Student.sort_alphabetically_by_last_name
  end
end

class WelcomeController < ApplicationController
  before_action :authenticate_teacher!

  def index # call method to sort students alphabetically
    @students = Student.sort_alphabetically_by_last_name
  end
end

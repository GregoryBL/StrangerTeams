class WelcomeController < ApplicationController
  def index
     redirect_to students_path
  end
end

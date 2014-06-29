class ProfileController < ApplicationController
  before_action :authenticate

  def index
    @student = Student.find(session[:user_id])
    @user = @student
  end
end

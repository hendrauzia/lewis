class ProfileController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(session[:user_id])
  end
end

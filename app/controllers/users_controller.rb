class UsersController < ApplicationController
  before_action :get_user

  def invite; end

  def update
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_path
    else
      redirect_to invite_user_path
    end
  end

  def get_user
    @user = User.find_by_email!(params[:email])
  end
end

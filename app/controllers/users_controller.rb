class UsersController < ApplicationController
  before_action :get_user

  def invite; end

  def update
    @parent.first_name = params[:first_name]
    @parent.last_name = params[:last_name]
    @parent.password = params[:password]
    @parent.password_confirmation = params[:password_confirmation]

    if @parent.save
      session[:user_id] = @parent.id
      redirect_to profile_path
    else
      redirect_to invite_user_path
    end
  end

  def get_user
    @parent = Parent.find_by_email!(params[:email])
  end
end

class ProfileController < ApplicationController
  before_action :authenticate, :get_user

  def index
  end

  def share
  end

  def notify
    if !Parent.exists?(email: params[:email])
      parent = Parent.new
      parent.update_attribute(:email, params[:email])

      flash[:notice] = "Hasil kamu sudah di share"
    else
      flash[:notice] = "Email sudah terdaftar"
    end

    redirect_to profile_path
  end

  def get_user
    @student = Student.find(session[:user_id])
    @user = @student
  end
end

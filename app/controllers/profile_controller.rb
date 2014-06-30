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

      Family.create(student_id: @student.id, parent_id: parent.id)

      flash[:notice] = "Hasil kamu sudah di share"
    else
      flash[:notice] = "Email sudah terdaftar"
    end

    redirect_to profile_path
  end

  def get_user
    @user = User.find(session[:user_id])
    @student = Student.find(@user.id) if @user.type.eql?("Student")
    @parent = Parent.find(@user.id) if @user.type.eql?("Parent")
  end
end

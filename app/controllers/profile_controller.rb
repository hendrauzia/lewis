class ProfileController < ApplicationController
  before_action :authenticate, :get_user

  def notify
    unless Parent.exists? email: params[:email]
      parent = Parent.new
      parent.update_attribute :email, params[:email]
      Family.create student: @student, parent: parent

      flash[:notice] = "Hasil kamu sudah di share"
    else
      flash[:notice] = "Kamu sudah pernah share ke email tersebut"
    end

    redirect_to profile_path
  end

  protected
  def get_user
    @user    = User.find session[:user_id]
    @student = Student.find @user.id if @user.type.eql? "Student"
    @parent  = Parent.find @user.id if @user.type.eql? "Parent"
  end
end

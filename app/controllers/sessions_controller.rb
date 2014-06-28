class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])

    if user.nil?
      flash[:notice] = "Email belum terdaftar"
      redirect_to new_session_path
    else
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to new_tryout_path
      else
        flash[:notice] = "Password salah"
        redirect_to new_session_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_tryout_path
  end
end

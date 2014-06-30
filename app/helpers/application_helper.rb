module ApplicationHelper
  def authenticated?
    return !session[:user_id].nil?
  end
end

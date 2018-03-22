module ApplicationHelper
  def logout
    link_to 'Logout', destroy_user_session_path, method: :delete if user_signed_in?
  end
end

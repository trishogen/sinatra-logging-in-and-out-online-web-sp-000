class Helpers

  def self.current_user(session)
    puts session[:user_id]
    @user = User.find(session['user_id'])
  end

  def self.is_logged_in?
  end
  
end

class Helpers

  def self.current_user(session)
    @user = User.find_by(username: session['username'])
  end

  def self.is_logged_in?
  end
  
end

class Helpers

  def self.current_user(session)
    @user = User.find_by(username: params['username'])
  end

  def self.is_logged_in?
  end
  
end

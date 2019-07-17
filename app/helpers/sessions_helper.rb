module SessionsHelper
    # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    #The session put the cockie into browser
  end
  
  #return the @current_user if exist, other wise find it from db based on the id(memorized in cookie)
  def current_user
    if session[:user_id]
      @current_user = @current_user || User.find_by(id: session[:user_id])
    end
  end
  
  # if user is not logged in, then log it in if exist
  def logged_in?
    !current_user.nil?
  end
  
  #Logs out the current user. session is a resource
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

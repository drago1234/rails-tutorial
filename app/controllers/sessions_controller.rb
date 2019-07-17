class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # find the user based on the email address
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
      # the if statement is true only if a user with the given email both exists in the database and has the given password, check this with debugger and type !!(user && user.authenticate('foobar'))
      # authenticate method is provided by has_secure_password(see 6.3.4).
      # downcase method to ensure a match when the submitted address is valid.
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email and password combination. Please try again!' # Not quite right!
      # falsh.now is method that specifically designed for displaying flash messages on rendered pages.
      render 'new'
    end
    # debugger 
    # params[:session]
    # User.fina_by(email: params[:session][:email]) :
    # See if user is authenticate: !!(user && user.authenticate(params[:session][:password]))
  end
  
  #call log_out method( in sessions_helper.rb) and redirect to index.html
  def destroy
    log_out
    redirect_to root_url
  end
  
end

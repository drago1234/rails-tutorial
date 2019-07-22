class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  # Only :edit and :update action required the logged-in user, so to protect them 
  #and not allow ysers to modify records in database
  
  #The page to show all the user
  def index
    @users = User.paginate(page: params[:page])
  end
  
  # Handle the action for page to show user page
  def show
    @user = User.find(params[:id])
    # debugger
    #debugger: is a powerful method for debugging, so use it whenever needed.
  end

  # Handle the action for page to make a new user (signup)
  def new
    @user = User.new
  end
  
  #Handle the submit action when user submitted their signup form. Becareful for the security issue, everything from users are not safe!!
  def create
    @user = User.new(user_params)   # Not the final implementation!
    # This is dangerous, it arranges to pass to User.new all data submitted by a user.
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Freelance Canvas" #treat it like a hash see: 7.4.2
      redirect_to user_url(@user) #Go to corresponding user profile page after account created
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    # update_attribute(name, value) is dangerous as create, so we use strong parameter to prevent mass assignment vulnerability
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  #Indented private method is from Author's suggestion as best practise!
  private
    #Strong parameter: For the best practise, this code, params[:user], is a hash of hash. It's not very obvious to see. 
    #Also for security issue: a malicious hacker could assign any value to any attribute. 
    #In our example, he could set the value of admin true, making himself a super user, enter something like, admin='1'. 
    #And url would be: http://www.example.com/user/signup?user[name]=ow3ned&user[admin]=1 
    #@return: the params hash, an appropriate initialization hash value.
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
       # This allows us to specify which parameters are required and which ones are permitted.
       # This code returns a version of the params hash with only the permitted attributes (while raising an error if the :user attribute is missing).
    end
    
    #Before filters
    
    #confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
      # current_user? is the session_helper method, verify the user is current_user
    end
end

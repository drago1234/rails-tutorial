class UsersController < ApplicationController
  # Handle the action for page to show user page
  def show
    @user = User.find(params[:id])
    # debugger
    #debugger: is a powerful method for debugging, so use it whenever needed.s
  end

  # Handle the action for page to make a new user (signup)
  def new
    @user = User.new
  end
  
  #Handle the submit action when user submitted their signup form. Becareful for the security issue, everything from users are not safe!!
  def create
    @user = User.new(user_params)   # Not the final implementation!
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
    # update_attribute(name, value) public
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

    #Strong parameter: For the best practise, this code, params[:user], is a hash of hash. It's not very obvious to see. Also for security issue when user enter something like, admin='1'.
    #@return: the params hash, an appropriate initialization hash value.
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

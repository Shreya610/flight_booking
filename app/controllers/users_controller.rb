class UsersController < ApplicationController
 def new
  @user=User.new
 end
 def index
  @user=User.new
 end
 def signup
   @user = User.new(params.require(:user).permit(:name,:email,:role,:password_digest))
   if @user.save
    session[:user_id] = @user.id
    redirect_to '/welcomeAdmin'
   end
 end

 def create
   @user = User.new(params.require(:user).permit(:name,:email,:role,:password_digest))
   if @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome'
   end
 end
end

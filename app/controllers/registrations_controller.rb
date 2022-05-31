class RegistrationsController < ApplicationController

 def admin
   if params["user"]
    @user = User.new(params.require(:user).permit(:name,:email,:role,:password_digest))
    if @user.save
     session[:user_id] = @user.id
     redirect_to '/flights'
    end
 
   else
    @user=User.new
   end
 end

 def index
   if params["user"]
    @user = User.new(params.require(:user).permit(:name,:email,:role,:password_digest))
    if @user.save
     session[:user_id] = @user.id
     redirect_to '/welcome'
    end

   else
    @user=User.new
   end
 end


end


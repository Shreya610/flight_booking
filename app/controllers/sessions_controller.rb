class SessionsController < ApplicationController
 def index
   if params[:email]
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
   end
 end
 def admin
   if params[:email]

    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to '/flights'
    else
      redirect_to '/loginAdmin'
    end
   end
 end

end


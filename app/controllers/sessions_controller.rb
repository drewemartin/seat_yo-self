class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to restaurants_path, :notice => "Logged In!"
      else
        render "new"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_path, :notice => "Logged Out!"
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      #Log the user in and redirect to the posts index page.
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to posts_path
    else
    flash.now[:danger] = 'Invalid name/password combination' 
    render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

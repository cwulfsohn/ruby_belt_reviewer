class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:first_name] = user.first_name
      session[:id] = user.id
      session[:state] = user.state
      redirect_to '/'
    else
      flash[:Rerrors] = user.errors.full_messages
      redirect_to '/users'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.city = params[:city]
    user.state = params[:state]
    user.save
    if user.valid?
      user.save
      session[:first_name] = user.first_name
      session[:id] = user.id
      session[:state] = user.state
      puts 'works'
    else
      puts 'does not work'
    end
    redirect_to '/'
  end

  def destroy
  end

  def login
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:first_name] = user.first_name
      session[:id] = user.id
      session[:state] = user.state
      redirect_to '/'
    else
      flash[:Lerrors] = "User does not exist"
      redirect_to '/users'
    end
  end

  def logout
    session.clear
    redirect_to '/users'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end
end

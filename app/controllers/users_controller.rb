class UsersController < ApplicationController

  skip_before_filter :logged_in_and_activated

  def create
    @user = User.new(params[:user])
    if @user.save
      activation_token = SecureRandom.urlsafe_base64
      @user.activation_token = activation_token
      @user.save

      flash[:notices] ||= []
      flash[:notices] << "You created a user."
      msg = UserMailer.welcome_email(@user)
      msg.deliver!

      #login page with flash to go to email and activate
      redirect_to new_session_url
    else
      flash.now[:notices] ||= []
      flash.now[:notices] << "Invalid email/password"

      render :new
    end
  end

  def activate
    user = User.find_by_activation_token(params[:token])
    user.activation_token = nil
    user.save

      #login
    redirect_to new_session_url
  end

end

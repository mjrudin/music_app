class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(user)
    @user = user
    token = user.activation_token
    @url  = "#{users_activate_url}?token=#{token}"
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end
end

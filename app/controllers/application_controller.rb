class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def locals(action = nil, hash)
    render action: action, locals: hash
  end

  protected

  #->(user_login:devise)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){ |u|
      u.permit(:oauth_pass_set, :uid, :provider,
      :email, :password, :password_confirmation, :remember_me, :type )}

    devise_parameter_sanitizer.permit(:sign_in){ |u|
      u.permit(:login, :uid, :provider, :email, :password,
      :remember_me) }

    devise_parameter_sanitizer.permit(:account_update){ |u|
      u.permit(:email, :oauth_pass_set, :uid, :provider, :password,
      :password_confirmation, :current_password) }

    devise_parameter_sanitizer.permit(:accept_invitation){|u|
      u.permit( :uid, :provider, :password,
      :password_confirmation, :invitation_token, :type) }
  end

  private

  def redirect_from_admin
    redirect_to root_path
  end

end

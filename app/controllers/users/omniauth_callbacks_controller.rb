require 'pp'
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    # Or alternatively,
    # raise ActionController::RoutingError.new('Not Found')
  end

  def facebook
    # You need to implement the method below in your model
    @user = User::find_or_create(request.env["omniauth.auth"].extra.raw_info.email)

    if @user && @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
    end
  end

  def twitter
    @user = User::find_or_create(request.env["omniauth.auth"]["uid"].to_s+"@twitter.com")

    if @user && @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
    end

  end

  def google
    @user = User.find_or_create(request.env["omniauth.auth"].info["email"])

    if @user && @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
    end
  end
end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
skip_before_filter :before_filter, :only =>[:stripe_connect]

  def facebook
    @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def stripe_connect
    @user = User.stripe_oauth(env["omniauth.auth"], current_user)
    if @user.save
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Stripe"
      redirect_to edit_user_url(current_user)
    else
      flash[:notice] = I18n.t "devise.omniauth_callbacks.error", :kind => "Stripe"
      redirect_to edit_user_url(current_user)
    end
  end

end

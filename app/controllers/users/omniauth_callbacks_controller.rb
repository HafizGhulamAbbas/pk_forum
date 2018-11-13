class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # TODO: Refactor to use only one action
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      session[:user_pending_zipcode] = @user.id
      # flash.notice = 'You are successfully registered.'
      redirect_to request.env['omniauth.origin']
    else
      flash.notice = 'Unable to create user.'
      # session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to request.env['omniauth.origin']
    end
  end

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      session[:user_pending_zipcode] = @user.id
      redirect_to request.env['omniauth.origin']
    else
      flash.notice = 'Unable to create user.'
      redirect_to request.env['omniauth.origin']
    end
  end

  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      session[:user_pending_zipcode] = @user.id
      redirect_to request.env['omniauth.origin']
    else
      flash.notice = 'Unable to create user.'
      redirect_to request.env['omniauth.origin']
    end
  end

  def failure
    # redirect_to root_path
    flash.alert = 'Unable to create user.'
    redirect_to request.env['omniauth.origin']
  end
end

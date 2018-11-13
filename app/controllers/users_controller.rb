class UsersController < ApplicationController

  api :POST, 'users.json', 'Register User'
  param :first_name, String, required: true
  param :last_name, String, required: true
  param :email, String, required: true
  param :zipcode, String, required: true
  param :advertising_id, String, required: true
  param :device_type, String, desc: 'android or ios', required: true
  param :udid, String, required: true, desc: 'User device ID (by firebase) for push'
  param :provider, String, desc: 'email or facebook or google or twitter', required: true
  param :token, String, desc: 'facebook or google or twitter token'
  param :uid, String, desc: 'facebook or google or twitter User ID'
  error 500, 'Error occurred'
  example '{
      "id": 2,
      "first_name": "Soban",
      "last_name": "Akram",
      "email": "test@mailinator.com",
      "zipcode": "61010",
      "city": "Lahore",
      "state": "Punjab",
      "country": "Pakistan",
      "advertising_id": "wsb235346trt7fh3y4wg",
      "device_type": "android",
      "udid": "242354139dd44513465134r345e"
    }'

  # TODO: Correct logic here, don't just dummy for all
  def create
    @user = User.where(email: user_params[:email]).assign_or_new(user_params)
    # TODO: Remove and add in before_create
    @user.advertising_id = '6a05a329-12a4-4b09-ab6c-2cece3b3803a'
    @user.device_type = 'android'
    @user.udid = 'eAOnmT3xxn8:APA91bF7Ch4URpZexSQJ-cC1dlIhG6Aje89SnzJn1f3DlcMn2GJ7daYXCmv1S0ZQzm2iyuSJURDsjqFSA-VT33NFd-eFAujsq8d2bKzISsJ_nVWxSqe93asieD8MrZ91yP5mzeVh7Hv-d-EpYEceGsLC3soO2blZpg'
    @user.provider = 'email'
    if @user.save
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_back(fallback_location: home_index_path, flash: { notice: 'Successfully Registered.' }) }
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        # TODO: Check if we need this notice error
        format.js { flash[:notice] = 'Unable to create user.' }
        format.json { render json: { message: @user.errors.full_messages.join(', ') }, status: 400 }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      session[:user_id] = @user.id
      session[:user_pending_zipcode] = nil
      redirect_back(fallback_location: home_index_path, notice: 'Successfully Registered.')
    else
      render :create
    end
  end

  private

  def user_params
    if request.xhr?
      params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :advertising_id, :device_type, :udid, :provider, :token)
    else
      params.permit(:first_name, :last_name, :email, :zipcode, :advertising_id, :device_type, :udid, :provider, :token)
    end
  end
end

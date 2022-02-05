class UsersController < ApplicationController

      skip_before_action :authorized, only: [:new, :create]
  
   def index
        if current_user.has_role?(:superadmin)
            @users = User.all
            
        else
            redirect_to root_path
        end
    end


  def new
    @user = User.new
 end

  # TODO: Correct logic here, don't just dummy for all
  def create
    # @user = User.where(email: user_params[:email]).assign_or_new(user_params)
    # # TODO: Remove and add in before_create
    # @user.advertising_id = '6a05a329-12a4-4b09-ab6c-2cece3b3803a'
    # @user.device_type = 'android'
    # @user.udid = 'eAOnmT3xxn8:APA91bF7Ch4URpZexSQJ-cC1dlIhG6Aje89SnzJn1f3DlcMn2GJ7daYXCmv1S0ZQzm2iyuSJURDsjqFSA-VT33NFd-eFAujsq8d2bKzISsJ_nVWxSqe93asieD8MrZ91yP5mzeVh7Hv-d-EpYEceGsLC3soO2blZpg'
    # @user.provider = 'email'
    # if @user.save
    #   session[:user_id] = @user.id
    #   respond_to do |format|
    #     format.html { redirect_back(fallback_location: home_index_path, flash: { notice: 'Successfully Registered.' }) }
    #     format.json { render json: @user }
    #   end
    # else
    #   respond_to do |format|
    #     # TODO: Check if we need this notice error
    #     format.js { flash[:notice] = 'Unable to create user.' }
    #     format.json { render json: { message: @user.errors.full_messages.join(', ') }, status: 400 }
    #   end
    # end

    # @user = User.create(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone))
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You're now registered"
      redirect_to welcome_path
      # redirect_to '/welcome'
    else
      render :new
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
      # params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :advertising_id, :device_type, :udid, :provider, :token)
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, {role_ids: []})
    else
      # params.permit(:first_name, :last_name, :email, :zipcode, :advertising_id, :device_type, :udid, :provider, :token)
      params.permit(:first_name, :last_name, :email, :password, :phone, {role_ids: []})
    end
  end
end

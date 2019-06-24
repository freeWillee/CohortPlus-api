class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  wrap_parameters format: [:json], include: [:password,:username, :password, :first_name, :last_name, :email, :profile_url, :admin]

  # GET /users
  def index

    render json: UserSerializer.new(User.all)
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user)
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.position = Position.find_by(title: params[:position])
    
    # Apply default URL path to profile pic if none provided
    @user.checkProfilePic(user_params[:profile_url])
    
    if @user.save
      render json: UserSerializer.new(@user), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update    
    if @user.update(user_params)
      render json: UserSerializer.new(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :profile_url, :admin, :position_id).delete_if do |key, val|
        val == ""
      end
    end


end

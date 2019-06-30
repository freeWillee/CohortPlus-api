class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # wrap_parameters format: [:json], include: [:password,:username, :password, :first_name, :last_name, :email, :profile_url, :admin, :position]

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
    @position = Position.find_by(title: params[:user][:position])
    @user.position = @position
    
    # Apply default URL path to profile pic if none provided
    @user.checkProfilePic(user_params[:profile_url])
    
    if @user.save
      if params[:user][:isSignUp]
        session[:user_id] = @user.id
      end

      render json: UserSerializer.new(@user), status: :created
    else
      resp = {
        error: @user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update    
    if @user.update(edit_user_params)
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
      params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :profile_url, :admin).delete_if {|key, val| key == "profile_url" && val==""}
    end

    def edit_user_params
      updatedParams = params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :profile_url, :admin, :position_id).delete_if {|key, val| val==""}
    end


end

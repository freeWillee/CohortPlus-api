class Api::V1::PositionsController < ApplicationController
  before_action :set_position, only: [:show, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.all

    render json: PositionSerializer.new(Position.all)
  end

  # GET /positions/1
  def show
    render json: PositionSerializer.new(@position)
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: PositionSerializer.new(@position), status: :created, location: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /positions/1
  def update
    if @position.update(position_params)
      render json: PositionSerializer.new(@position)
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  # DELETE /positions/1
  def destroy
    @position.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      params.require(:position).permit(:title)
    end
end

class Api::V1::CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index

    render json: CommentSerializer.new(Comment.all)
  end

  # GET /comments/1
  def show
    render json: CommentSerializer.new(@comment)
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: CommentSerializer.new(@comment), status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: CommentSerializer.new(@comment)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:title, :content, :commentable_id, :commentable_type)
    end
end

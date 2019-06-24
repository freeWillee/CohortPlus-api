class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  wrap_parameters format: [:json], include: [:title, :content, :status, :due_date, :user_id, :project_id]

  # GET /tasks
  def index
    render json: TaskSerializer.new(Task.all)
  end

  # GET /tasks/1
  def show
    render json: TaskSerializer.new(@task)
  end

  # POST /tasks
  def create

    @task = Task.new(task_params)
    @task.user = User.find_by(username: params[:username])
    @task.project = Project.find_by(title: params[:project])

    if @task.save
      render json: TaskSerializer.new(@task), status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: TaskSerializer.new(@task)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :content, :status, :due_date, :user_id, :project_id)
    end

    # def serializer
    #   TaskSerializer
    # end
end

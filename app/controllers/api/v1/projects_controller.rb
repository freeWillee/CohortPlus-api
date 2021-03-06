class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /projects
  def index
    if params[:user_id]
      @projects = User.find_by(id: params[:user_id]).projects.uniq
      render json: ProjectSerializer.new(@projects)    
    else
      @projects = Project.all
      render json: ProjectSerializer.new(@projects)
    end
  end

  # GET /projects/1
  def show
    render json: ProjectSerializer.new(@project)
  end

  # POST /projects
  def create    
    @project = Project.new(project_params)

    if @project.save      
      render json: ProjectSerializer.new(@project), status: :created
    else
      resp = {
        error: @project.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: ProjectSerializer.new(@project)
    else
      render json: @project.errors, status: :unprocessable_entit
    y
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    Task.where(project_id: @project.id).destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:title, :description, :deadline).delete_if {|key, val| val==""}
    end
end

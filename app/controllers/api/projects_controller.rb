class Api::ProjectsController < ApplicationController
  before_action :require_login!, only: [:create, :update, :destroy]

  def index
    if params[:project].nil?
      @projects = Project.all
    else
      @projects = Project.where(author_id: project_params[:author_id].to_i)
    end
    render :index
    # render json: ['test errors'], status: 422
  end

  def show
    # @project = Project.includes(:steps).find_by(id: params[:id])
    @project = Project.find_by(id: params[:id])
    render :show
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render :show
    else
      render json: @project.errors.full_messages, status: 422
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      render :show
    else
      render json: @project.errors.full_messages, status: 422
    end
  end

  def destroy
    @project = Project.find(params[:id])

    if @project.destroy
      render :show
    else
      render json: @project.errors.full_messages, status: 422
    end

  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :image_url, :video_url, :published, :author_id, :image)
  end
end

class Api::ProjectsController < ApplicationController
  def index
    if(params[:user_ids])
      @projects = Project.where(id: params[:user_ids].map(&:to_i))
    else
      @projects = Project.all
    end
    render :index
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
    params.require(:project).permit(:title, :description, :image_url, :video_url, :published, :author_id, user_ids: [])
  end
end

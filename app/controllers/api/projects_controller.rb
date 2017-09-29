class Api::ProjectsController < ApplicationController
  before_action :require_login!, only: [:create, :update, :destroy]
  before_action :require_user!, only: [:create, :update, :destroy]

  def index
    if params[:project].nil?
      @projects = Project.where(published: true)
    # elsif project_params[:tag]
    #   # @projects = [];
    # @projects = Project.where(published: true) do |project|
    #     project.tags.any? { |t| t.name == 'Computer Science'}
    #   end
    elsif project_params[:filter] == 'true'
      @projects = Project.where(author_id: project_params[:author_id].to_i).where(published: true)
    elsif project_params[:filter] == 'false'
      @projects = Project.where(author_id: project_params[:author_id].to_i)
    else
      @projects = Project.find(project_params[:project_ids])
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
    params.require(:project).permit(:id, :title, :description, :video_url, :published, :author_id, :image, :filter, project_ids: [])
  end

  def require_user!
    if !params[:project] || current_user.id != params[:project][:author_id].to_i
      render json: ["You are not authorized to perform this action"],  status: 401
    end
  end
end

class Api::ProjectsController < ApplicationController
  before_action :require_login!, only: [:create, :update, :destroy]
  before_action :require_user!, only: [:create, :update, :destroy]

  def index
    if params[:project].nil?
      @projects = Project.includes(:tags).where(published: true)
    elsif project_params[:filter] == 'true'
      @projects = Project.includes(:tags).where(author_id: project_params[:author_id].to_i).where(published: true)
    elsif project_params[:filter] == 'false'
      @projects = Project.includes(:tags).where(author_id: project_params[:author_id].to_i)
    elsif project_params[:tag_name]
      @projects = Tag.find_by(name: project_params[:tag_name]).projects.includes(:tags)
      # @projects = Project.includes(:tags)
    else
      @projects = Project.includes(:favorite_users).find(project_params[:project_ids]) # favorite
    end
    render :index
    # render json: ['test errors'], status: 422
  end

  def show
    @project = Project.includes(:steps).find_by(id: params[:id])
    # @project = Project.find_by(id: params[:id])
    render :show
  end

  def create
    tags = Tag.pluck(:name)
    tag_ids = params[:tags].split(',').map { |name| tags.index(name) + 1 }
    package = project_params

    package[:tag_ids] = tag_ids

    @project = Project.new(package)

    if @project.save
      render :show
    else
      render json: @project.errors.full_messages, status: 422
    end
  end

  def update
    @project = Project.find(params[:id])

    tags = Tag.pluck(:name)
    tag_ids = params[:tags].split(',').map { |name| tags.index(name) + 1 }
    package = project_params

    package[:tag_ids] = tag_ids

    if @project.update(package)
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
    params.require(:project).permit(:id, :title, :description, :video_url, :published, :author_id, :image, :filter, :tag_name, :tags, project_ids: [], tags_ids: [])
  end

  def require_user!
    if !params[:project] || current_user.id != params[:project][:author_id].to_i
      render json: ["You are not authorized to perform this action"],  status: 401
    end
  end
end

class Api::CommentsController < ApplicationController
  before_action :require_login!, only: [:create, :update]
  before_action :require_user!, only: [:update]

  def index
    @comments = Comment.where(project_id: comment_params[:project_id].to_i)
    render :index
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      render :show
    else
      render json :@comment.errors.full_messages, status: 422
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :body, :project_id, :author_id)
  end

  def require_user!
    if !params[:comment] || current_user.id != params[:comment][:author_id].to_i
      render json: ["You are not authorized to perform this action"],  status: 401
    end
  end

end

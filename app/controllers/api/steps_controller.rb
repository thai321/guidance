class Api::StepsController < ApplicationController
  before_action :require_login!, only: [:create, :update, :destroy]
  before_action :require_user!, only: [:update, :destroy]

  def index
    @steps = Step.where(project_id: step_params[:project_id])
    render :index
  end

  def create
    @step = Step.new(step_params)

    if @step.save
      render :show
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def update
    @step = Step.find(step_params[:id])

    if @step.update(step_params)
      render :show
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def show
    @step = Step.find(params[:id])
    render :show
  end

  def destroy
    @step = Step.find(step_params[:id])

    if @step.destroy
      render :show
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  private
  def step_params
    params.require(:step).permit(:id, :title, :body, :project_id, step_ids: [])
  end

  def require_user!
    if !params[:step] || current_user.id != Step.find(params[:id]).author.id
      render json: ["You are not authorized to perform this action"],  status: 401
    end
  end
end

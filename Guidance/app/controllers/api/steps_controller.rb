class Api::StepsController < ApplicationController
  before_action :require_login!, only: [:create, :update, :destroy]

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
end

class Api::StepsController < ApplicationController
  before_action :require_login!, only: [:create, :destroy]

  def index
    @steps = Step.all
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

  def destroy
    @step = Step.find(params[:id])

    if @step.update(step_params)
      render :show
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  private
  def step_params
    params.require(:step).permit(:title, :body, :project_id, step_ids: [])
  end
end

class Api::ProjectsController < ApplicationController
  def index
    @projects = Project.all
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
    params.require(:project).permit(:title, :description, :image_url, :video_url, :published, :author_id)
  end
end




# class Api::GuestsController < ApplicationController
#   def index
#     @guests = Guest.all
#     render :index
#   end
#
#   def show
#     @guest = Guest.includes(:gifts).find_by(id: params[:id])
#     render :show
#   end
# end

# class Api::GiftsController < ApplicationController
#   def index
#     @gifts = Gift.where(guest_id: params[:guest_id])
#     render :index
#   end
#
#   def show
#     @gift = Gift.find_by(id: params[:id])
#     render :show
#   end
# end

# class Api::PartiesController < ApplicationController
#   def index
#     @parties = Party.all.includes(guests: [:gifts])
#     render :index
#   end
#
#   def show
#     @party = Party.includes(guests: [:gifts]).find_by(id: params[:id])
#     render :show
#   end
# end

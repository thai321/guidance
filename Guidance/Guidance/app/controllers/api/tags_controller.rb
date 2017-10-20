class Api::TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  private
  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end

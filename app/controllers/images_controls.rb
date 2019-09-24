class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @program = Program.find(params[:program_id])
    @program.image.create(image_params)
    redirect_to program_path(@program)
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image)
  end
end
class GallerysController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @gallerys = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    current_user.gallerys.create(gallery_params)
    redirect_to gallerys_path
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])

    if @gallery.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @gallery.update_attributes(gallery_params)
    if @gallery.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    if @gallery.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    @gallery.destroy
    redirect_to root_path
  end

  private
 
  def gallery_params
    params.require(:gallery).permit(:name)
  end
end

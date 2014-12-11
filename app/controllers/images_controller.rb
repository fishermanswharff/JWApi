class ImagesController < ApplicationController
  
  def index
    @images = Image.all
    render json: @images, status: :ok
  end
  
  def show
    @image = Image.find(params[:id])
    render json: @image, status: :ok
  end
  
  def create
    @image = Image.create(image_params)
    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    head :no_content
  end
  
  private
  def image_params
    params.require(:image).permit(:url, :post_id)
  end
end
class ThumbnailsController < ApplicationController

  def create
    @thumb = Thumbnail.create(thumbnails_params)
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @post.thumbnail = @thumb
      render json: @post, status: :ok, location: @post
    else
      if @thumb.save
        render json: @thumb, status: :created, location: @thumb
      else
        render json: @thumb.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
  end

  private
  def thumbnails_params
    params.require(:thumbnail).permit(:url)
  end
end
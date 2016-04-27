class FeaturedImagesController < ApplicationController

  def create
    @featured_image = FeaturedImage.create(featured_image_params)
    if params[:post_id]
      post = Post.find(params[:post_id])
      post.featured_image = @featured_image
      post.save
      render json: post, serializer: PostSerializer, include: ['featured_image'], status: :created
    else
      if @featured_image.save
        render json: @featured_image, status: :created, location: @featured_image
      else
        render json: @featured_image.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @feature = FeaturedImage.find(params[:id])
    if @feature.update(featured_image_params)
      render json: @post, serializer: PostSerializer, include: ['featured_image'], status: :accepted
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
  def featured_image_params
    params.require(:featured_image).permit(:url, :post_id)
  end

end

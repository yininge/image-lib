class ImageController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @images = Image.all
  end

  def create
    data = params.require(:image).permit(:description, :file)
    @image = Image.new(data)
    respond_to do |format|
      if @image.save
        format.html { redirect_to image_index_path }
      end
    end
  end
end

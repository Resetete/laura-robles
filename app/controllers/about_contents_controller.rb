class AboutContentsController < ApplicationController
  layout 'admin'

  def index
    @contents = AboutContent.all
  end

  def new
    @content = AboutContent.new
  end

  def create
    @content = AboutContent.new(about_content_params)
    if @content.save
      redirect_to about_contents_path
    else
      render 'new'
    end
  end

  private

  def about_content_params
    params.require(:about_content).permit(
      part_1: [:en, :es, :de],
      part_2: [:en, :es, :de],
    )
  end
end
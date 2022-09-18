class AboutContentsController < ApplicationController
  layout 'admin'

  before_action :set_about_content, only: [:edit, :update, :destroy]

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

  def edit; end

  def update
    if @content.update(about_content_params)
      flash[:notice] = 'Article successfully updated'
      redirect_to about_contents_path
    else
      render 'edit'
    end
  end

  def destroy
    @content.destroy
    flash[:alert] = 'successfully deleted'
    redirect_to about_contents_path
  end

  private

  def about_content_params
    params.require(:about_content).permit(
      :active,
      part_1: [:en, :es, :de],
      part_2: [:en, :es, :de],
    )
  end

  def set_about_content
    @content = AboutContent.find(params[:id])
  end
end
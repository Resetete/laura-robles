# frozen_string_literal: true

class AboutContentsController < ApplicationController
  layout 'admin'

  before_action :set_about_content, only: %i[show edit update destroy]

  def index
    @contents = AboutContent.all
  end

  def new
    @content = AboutContent.new
  end

  def create
    @content = AboutContent.new(about_content_params)
    if @content.save
      flash[:notice] = 'successfully created'
      redirect_to about_contents_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @content.update(about_content_params)
      flash[:notice] = 'successfully updated'
      redirect_to about_contents_path
    else
      render 'edit'
    end
  end

  def destroy
    if AboutContent.active_db_texts.count == 1 && @content.active == true
      flash[:alert] = 'Cannot delete without any active text'
    else
      if @content.destroy
        flash[:alert] = 'successfully deleted'
        redirect_to about_contents_path
      else
        flash[:alert] = 'something went wrong'
        redirect_to about_contents_path
      end
    end
  end

  private

  def about_content_params
    params.require(:about_content).permit(
      :active,
      :part_1_en, :part_1_es, :part_1_de,
      :part_2_en, :part_2_es, :part_2_de,
    )
  end

  def set_about_content
    @content = AboutContent.find(params[:id])
  end
end

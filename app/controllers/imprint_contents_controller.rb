# frozen_string_literal: true

class ImprintContentsController < ApplicationController
  layout 'admin'

  before_action :set_imprint_content, except: %i[new create]

  def new
    @imprint_content = ImprintContent.new
  end

  def create
    @imprint_content = ImprintContent.new(imprint_content_params)
    if @imprint_content.save
      flash[:notice] = 'successfully created'
      redirect_to imprint_contents_path
    else
      flash[:alert] = 'something went wrong'
      render 'new'
    end
  end

  def edit; end

  def update
    if @imprint_content.update(imprint_content_params)
      flash[:notice] = 'successfully updated'
      redirect_to imprint_contents_path
    else
      render 'edit'
    end
  end

  # I dont allow to delete the imprint since it is a legal requirement

  private

  def set_imprint_content
    @imprint_content = ImprintContent.find(params[:id])
  end

  def imprint_content_params
    params.require(:imprint_content).permit(:name, :address)
  end
end

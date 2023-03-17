# frozen_string_literal: true

class ProjectContentsController < ApplicationController
  layout 'admin'

  before_action :set_project_content, except: %i[new create index]

  def index
    @project_contents = ProjectContent.all
  end

  def new
    @project_content = ProjectContent.new
  end

  def create
    @project_content = ProjectContent.new(project_content_params)
    if @project_content.save
      flash[:notice] = 'successfully created'
      redirect_to project_contents_path
    else
      flash[:alert] = 'something went wrong'
      render 'new'
    end
  end

  def edit; end

  def update
    if @project_content.update(project_content_params)
      flash[:notice] = 'successfully updated'
      redirect_to project_contents_path
    else
      render 'edit'
    end
  end

  def destroy
    if ProjectContent.count == 1
      flash[:alert] = 'Cannot delete - need to have at least one project. Instead edit the current entry.'
    elsif @project_content.destroy
      flash[:alert] = 'successfully deleted'
      redirect_to project_contents_path
    else
      flash[:alert] = 'something went wrong'
      redirect_to project_contents_path
    end
  end

  private

  def set_project_content
    @project_content = ProjectContent.find(params[:id])
  end

  def project_content_params
    params.require(:project_content).permit(
      :title,
      :description_en,
      :description_es,
      :description_de,
      :image_white,
      :image_black,
      :musicians,
      :audio_file
    )
  end
end

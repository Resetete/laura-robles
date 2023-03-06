# frozen_string_literal: true

class VideoPlayerContentsController < ApplicationController
  layout 'admin'

  before_action :set_video_content, except: %i[new create index]

  def index
    @video_contents = VideoPlayerContent.all
  end

  def new
    @video_content = VideoPlayerContent.new
  end

  def create
    @video_content = VideoPlayerContent.new(video_content_params)
    if @video_content.save
      flash[:notice] = 'successfully created'
      redirect_to video_player_contents_path
    else
      flash[:alert] = 'something went wrong'
      render 'new'
    end
  end

  def edit; end

  def update
    if @video_content.update(video_content_params)
      flash[:notice] = 'successfully updated'
      redirect_to video_player_contents_path
    else
      render 'edit'
    end
  end

  def destroy
    if VideoPlayerContent.count == 1
      flash[:alert] = 'Cannot delete - need to have at least one video. Instead edit the current entry.'
    elsif @video_content.destroy
      flash[:alert] = 'successfully deleted'
      redirect_to video_player_contents_path
    else
      flash[:alert] = 'something went wrong'
      redirect_to video_player_contents_path
    end
  end

  private

  def set_video_content
    @video_content = VideoPlayerContent.find(params[:id])
  end

  def video_content_params
    params.require(:video_player_content).permit(
      :instrument,
      :video_url,
      :video,
    )
  end
end

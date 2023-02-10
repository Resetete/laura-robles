# frozen_string_literal: true

class NewsContentsController < ApplicationController
  layout 'admin'

  before_action :set_news_content, except: %i[new create index]

  def index
    @news_contents = NewsContent.all
  end

  def new
    @news_content = NewsContent.new
  end

  def create
    @news_content = NewsContent.new(news_content_params)
    if @news_content.save
      flash[:notice] = 'successfully created'
      redirect_to news_contents_path
    else
      flash[:alert] = 'something went wrong'
      render 'new'
    end
  end

  def edit; end

  def update
    if @news_content.update(news_content_params)
      flash[:notice] = 'successfully updated'
      redirect_to news_contents_path
    else
      render 'edit'
    end
  end

  def destroy
    if @news_content.destroy
      flash[:alert] = 'successfully deleted'
      redirect_to news_contents_path
    else
      flash[:alert] = 'something went wrong'
      redirect_to news_contents_path
    end
  end

  private

  def set_news_content
    @news_content = NewsContent.find(params[:id])
  end

  def news_content_params
    params.require(:news_content).permit(
      :title,
      :date,
      :content,
      :social_media_permalink
    )
  end
end

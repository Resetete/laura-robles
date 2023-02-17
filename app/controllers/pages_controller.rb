# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_admin!

  layout 'application'

  def home
    @about_content = AboutContent.where(active: true).first
    @news_contents = NewsContent.order(date: :desc).first(3)
  end

  def imprint; end
end

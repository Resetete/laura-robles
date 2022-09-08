class AboutContentsController < ApplicationController
  def index
    @content = AboutContent.all
  end
end
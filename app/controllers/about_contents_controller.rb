class AboutContentsController < ApplicationController
  def index
    @contents = AboutContent.all
  end
end
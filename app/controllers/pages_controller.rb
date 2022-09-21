# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_admin!

  def home
    @about_content = AboutContent.where(active: true).first
  end
end

# frozen_string_literal: true

class NewsContent < ApplicationRecord
  validates :title, :content, :date, presence: true
end

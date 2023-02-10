# frozen_string_literal: true

class NewsContent < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
end

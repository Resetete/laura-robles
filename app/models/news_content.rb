# frozen_string_literal: true

class NewsContent < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :date
end

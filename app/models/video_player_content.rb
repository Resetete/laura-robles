class VideoPlayerContent < ApplicationRecord
  validates :video_url, presence: true
  validates :instrument, presence: true

  enum :instrument, { cajon: 'cajon', bass: 'bass' }
end
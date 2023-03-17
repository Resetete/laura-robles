# frozen_string_literal: true

class VideoPlayerContent < ApplicationRecord
  validates :instrument, presence: true

  enum :instrument, { cajon: 'cajon', bass: 'bass' }

  has_one_attached :video

  # call a custom validation
  validate :acceptable_video
  validate :video_present?

  private

  def video_present?
    video.attached? || video_url.present?
  end

  def acceptable_video
    return unless video.attached?

    if video.byte_size > 30.megabyte
      video_size = (video.byte_size / 1_000_000.0).round(2)
      errors.add(:image, "size #{image_size} MB exceeds 30 MB limit")
    end
  end
end

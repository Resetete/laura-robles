class ProjectContent < ApplicationRecord
  validates :title, presence: true

  validates :description_en, presence: true
  validates :description_es, presence: true
  validates :description_de, presence: true

  # active_storage - image upload
  has_one_attached :image_white do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  has_one_attached :image_black do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_one_attached :audio_file

  # call a custom validation
  validate :acceptable_image_black
  validate :acceptable_image_white

  # add ability to delete attached images
  attr_accessor :remove_attached_image_white
  attr_accessor :remove_attached_image_black

  after_save :purge_attached_image_black, if: :remove_attached_image_black?
  after_save :purge_attached_image_white, if: :remove_attached_image_white?

  private

  def acceptable_image_black
    acceptable_image(image_black)
  end

  def acceptable_image_white
    acceptable_image(image_white)
  end

  def acceptable_image(image)
    return unless image.attached?

    if image.byte_size > 1.megabyte
      image_size = (image.byte_size / 1_000_000.0).round(2)
      errors.add(:image, "size #{image_size} MB exceeds 1 MB limit")
    end

    acceptable_types = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/svg+xml']
    errors.add(:image, 'must be a JPEG, GIF, SVG or PNG') unless acceptable_types.include?(image.content_type)
  end

  # define the after_save action to remove an image
  def remove_attached_image_black?
    remove_attached_image_black == '1'
  end

  def remove_attached_image_white?
    remove_attached_image_white == '1'
  end

  def purge_attached_image_black
    image_black.purge_later
  end

  def purge_attached_image_white
    image_white.purge_later
  end
end

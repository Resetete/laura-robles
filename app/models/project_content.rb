class ProjectContent < ApplicationRecord
  validates :title, presence: true

  validates :description_en, presence: true
  validates :description_es, presence: true
  validates :description_de, presence: true

  # active_storage - image upload
  has_one_attached :image

  # call a custom validation
  validate :acceptable_image

  # add ability to delete attached images
  attr_accessor :remove_attached_image

  after_save :purge_attached_image, if: :remove_attached_image?

  private

  def acceptable_image
    return unless image.attached?

    if image.byte_size > 1.megabyte
      image_size = (image.byte_size / 1_000_000.0).round(2)
      errors.add(:image, "size #{image_size} MB exceeds 1 MB limit")
    end

    acceptable_types = ['image/jpeg', 'image/jpg', 'image/png']
    errors.add(:image, 'must be a JPEG or PNG') unless acceptable_types.include?(image.content_type)
  end

  # define the after_save action to remove an image
  def remove_attached_image?
    remove_attached_image == '1'
  end

  def purge_attached_image
    image.purge_later
  end
end

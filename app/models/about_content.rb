# frozen_string_literal: true


class AboutContent < ApplicationRecord
  before_save :set_all_others_to_false, if: :active?

  # Format of the part_1 and part_2 entries
  # { en: 'english about text', de: 'deutscher about text', es: 'texto em espanhol' }
  store :part_1, accessors: [:en, :es, :de], prefix: :part_1
  store :part_2, accessors: [:en, :es, :de], prefix: :part_2

  validate :active, :none_active_text?#, on: [:create, :update]

  def active?
    active
  end

  private

  def set_all_others_to_false
    self.class.where.not(id:).update(active: false)
  end

  def none_active_text?
    if AboutContent.where(active: true).empty? && self.active == false
      errors.add(:active, "Needs to have at least one about text set to be used on website")
    end
  end
end

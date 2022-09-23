# frozen_string_literal: true

class AboutContent < ApplicationRecord
  before_save :set_all_others_to_false, if: :active?

  store :part_1, accessors: [:en, :es, :de], prefix: :part_1
  store :part_2, accessors: [:en, :es, :de], prefix: :part_2


  # Format of the part_1 and part_2 entries
  # { en: 'english about text', de: 'deutscher about text', es: 'texto em espanhol' }

  def version_for(part:, locale:)
    public_send(part).to_h&.fetch(locale.to_s)
  end

  def active?
    active
  end

  private

  def set_all_others_to_false
    self.class.where.not(id:).update(active: false)
  end
end

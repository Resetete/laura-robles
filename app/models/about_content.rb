class AboutContent < ApplicationRecord
  before_save :set_all_others_to_false, if: :is_active?

  # Format of the part_1 and part_2 entries
  # { en: 'english about text', de: 'deutscher about text', es: 'texto em espanhol' }

  def version_for(part:, locale:)
    public_send(part).to_h&.fetch(locale.to_s)
  end

  private

  def set_all_others_to_false
    self.class.where.not(id: self.id).update_all(active: false)
  end

  def is_active?
    self.active
  end
end
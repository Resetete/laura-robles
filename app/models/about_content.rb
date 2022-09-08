class AboutContent < ApplicationRecord
  # Format of the part_1 and part_2 entries
  # { en: 'english about text', de: 'deutscher about text', es: 'texto em espanhol' }

  def version_for(part: 'part_1', locale:)
    public_send(part)&.fetch(locale)
  end
end
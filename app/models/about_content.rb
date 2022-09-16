class AboutContent < ApplicationRecord
  # Format of the part_1 and part_2 entries
  # { en: 'english about text', de: 'deutscher about text', es: 'texto em espanhol' }

  def version_for(part:, locale:)
    public_send(part).to_h&.fetch(locale.to_s)
  end
end
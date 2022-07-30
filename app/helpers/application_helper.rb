module ApplicationHelper
  CONTACT_EMAIL = 'mailto:lauraroblesinfo@gmail.com'.freeze

  def contact_helper
    link_to('contact', CONTACT_EMAIL, class: 'contact-link')
  end

  def contact_button
    tag.div(class: 'contact-button') do
      link_to CONTACT_EMAIL do
        image_tag('buttons/contact-button.svg')
      end
    end
  end

  def social_media_helper(animation:, direction:)
    tag.div(class: "social-media-#{direction} fa-2x #{'fa-fw' if direction == 'vertical'}") do
      [
        (link_to '#' do
          tag.i(class: "fa-brands fa-facebook-square #{animation}")
        end),
        (link_to '#' do
          tag.i(class: "fa-brands fa-instagram-square #{animation}")
        end),
        (link_to CONTACT_EMAIL do
          tag.i(class: "fa-brands fa-solid fa-square-envelope #{animation}")
        end)
      ].join.html_safe
    end
  end

  def language_selection
    tag.div(class: 'language-selection') do
      [
        link_to('DE', '#'),
        '/',
        link_to('EN', '#'),
        '/',
        link_to('ES', '#')
      ].join(' ').html_safe
    end
  end
end

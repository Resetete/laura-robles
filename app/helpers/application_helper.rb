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
        end),
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
        link_to('ES', '#'),
      ].join(' ').html_safe
    end
  end

  def slogan_animation
    [
      tag.div(id: 'animated-text') do
      [
        tag.div(id: 'text1'),
        tag.div(id: 'text2')
      ].join.html_safe
      end,
      tag.svg(id: 'filters') do
        tag.defs do
          tag.filter(id: 'threshold') do
            '<fecolormatrix>{:in => "SourceGraphic", :type => "matrix", :values => "1 0 0 0 0\r\n\t\t\t\t\t\t\t\t\t0 1 0 0 0\r\n\t\t\t\t\t\t\t\t\t0 0 1 0 0\r\n\t\t\t\t\t\t\t\t\t0 0 0 255 -140"}</fecolormatrix>'.html_safe
          end
        end
      end,
    ].join.html_safe
  end

  def footer_copyright
    tag.p(id: 'copyright') do
      [
        image_tag('chamaeleon.png', id: 'copyright-icon'),
        'copyright',
        Time.zone.now.year,
        link_to('theresamannschatz.design', 'https://theresamannschatz.design'),
      ].join.html_safe
    end
  end
end

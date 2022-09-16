module ApplicationHelper
  CONTACT_EMAIL = 'mailto:lauraroblesinfo@gmail.com'.freeze

  def navigation_items
    [
      link_to('Videos', '#videos'),
      link_to('News', '#news'),
      link_to('About', '#about'),
      link_to('Projects', '#projects'),
      link_to('Contact', CONTACT_EMAIL),
     ]
  end

  def navigation_items_html_safe
    navigation_items.join.html_safe
  end

  def contact_helper
    link_to(t('buttons.contact'), CONTACT_EMAIL, class: 'contact-link')
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
        (link_to 'https://www.facebook.com/Laura-Robles-Marcuello-112091183627939' do
          tag.i(class: "fa-brands fa-facebook-square #{animation}")
        end),
        (link_to 'https://www.instagram.com/lauraroblesmarcuello/' do
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
        link_to('DE', root_path(locale: :de)),
        '/',
        link_to('EN', root_path(locale: :en)),
        '/',
        link_to('ES', root_path(locale: :es)),
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
        Time.zone.now.year,
        link_to('@theresamannschatz.design', 'https://theresamannschatz.design'),
      ].join(' ').html_safe
    end
  end

  def admin_helper
    if admin_signed_in?
      button_to(t('buttons.admin_logout'), destroy_admin_session_path, method: :delete, class: 'btn btn-outline-dark')
    else
      link_to(t('buttons.admin_login'), new_admin_session_path, class: 'btn btn-outline-dark')
    end
  end
end

# frozen_string_literal: true

module ApplicationHelper
  CONTACT_EMAIL = 'mailto:lauraroblesinfo@gmail.com'

  def navigation_items
    [
      link_to('Videos', '#videos'),
      link_to('News', '#news'),
      link_to('About', '#about'),
      link_to(t('menu-bar.projects'), '#projects'),
      link_to(t('menu-bar.contact'), CONTACT_EMAIL)
    ]
  end

  def navigation_items_html_safe
    safe_join(navigation_items)
  end

  def contact_helper
    link_to(t('buttons.contact'), CONTACT_EMAIL, class: 'contact-link')
  end

  def contact_button
    tag.div(class: 'contact-button') do
      link_to CONTACT_EMAIL do
        image_tag('buttons/contact-button.png')
      end
    end
  end

  def social_media_helper(animation:, direction:)
    tag.div(class: "social-media-#{direction} fa-2x #{'fa-fw' if direction == 'vertical'}") do
      safe_join([
                  (link_to 'https://www.facebook.com/Laura-Robles-Marcuello-112091183627939' do
                    tag.i(class: "fa-brands fa-facebook-square #{animation}")
                  end),
                  (link_to 'https://www.instagram.com/lauraroblesmarcuello/' do
                    tag.i(class: "fa-brands fa-instagram-square #{animation}")
                  end),
                  (link_to CONTACT_EMAIL do
                    tag.i(class: "fa-brands fa-solid fa-square-envelope #{animation}")
                  end)
                ])
    end
  end

  def language_selection(target: 'root_path')
    target = target.nil? ? 'root_path' : target
    [
      link_to('DE', public_send(target.to_s, locale: :de)),
      '/',
      link_to('EN', public_send(target.to_s, locale: :en)),
      '/',
      link_to('ES', public_send(target.to_s, locale: :es))
    ]
  end

  def language_selection_html_safe
    tag.div(class: 'language-selection') do
      safe_join(language_selection)
    end
  end

  def slogan_animation
    safe_join([
                tag.div(id: 'animated-text') do
                  safe_join([
                              tag.div(id: 'text1'),
                              tag.div(id: 'text2')
                            ])
                end,
                tag.svg(id: 'filters') do
                  tag.defs do
                    tag.filter(id: 'threshold') do
                      '<fecolormatrix>{:in => "SourceGraphic", :type => "matrix", :values => "1 0 0 0 0\r\n\t\t\t\t\t\t\t\t\t0 1 0 0 0\r\n\t\t\t\t\t\t\t\t\t0 0 1 0 0\r\n\t\t\t\t\t\t\t\t\t0 0 0 255 -140"}</fecolormatrix>'.html_safe
                    end
                  end
                end
              ])
  end

  def footer_copyright
    tag.p(id: 'copyright') do
      safe_join([
                  image_tag('chamaeleon.png', id: 'copyright-icon'),
                  Time.zone.now.year,
                  link_to('@theresamannschatz.design', 'https://theresamannschatz.design')
                ], ' ')
    end
  end

  def admin_helper
    if admin_signed_in?
      button_to(t('buttons.admin_logout'), destroy_admin_session_path, method: :delete, class: 'btn btn-outline-dark')
    else
      link_to(t('buttons.admin_login'), new_admin_session_path, class: 'btn btn-outline-dark')
    end
  end

  def get_current_page_path(request)
    split_path = request.path.split('/')
    split_path_length = split_path.count

    case split_path_length
    when 2
      # for multi object routes without locale e.g. about_contents_path (index)
      "#{split_path.last}_path"
    when 3
      # for multi object routes e.g. en/about_contents_path (index)
      "#{split_path.last}_path"
    when 4
      # for single object routes, new e.g. en/new_about_content_path
      "#{[split_path[3], split_path[2].chomp('s')].join('_')}_path"
    when 5
      # for single object routes with :id, edit e.g. en/edit_about_content_path(:id)
      "#{[split_path[4], split_path[2].chomp('s')].join('_')}_path"
    end
  end

  def ordinalize(number)
    case number
    when 1
      'first'
    when 2
      'second'
    when 3
      'third'
    when 4
      'fourth'
    when 5
      'fifth'
    when 6
      'sixth'
    when 7
      'seventh'
    when 8
      'eigth'
    when 9
      'ninth'
    when 10
      'tenth'
    end
  end
end

module AdminHelper
  def admin_editor_tools(main_path:, object: nil)
    tag.div(class: 'btn-group', role: 'group') do
      [
        link_to(t('buttons.new'), public_send("new_#{main_path}_path", locale: I18n.locale), class: 'btn btn-info'),
        link_to(t('buttons.edit'), public_send("edit_#{main_path}_path", id: object, locale: I18n.locale), class: 'btn btn-primary'),
        link_to(t('buttons.index'), public_send("#{main_path}s_path", locale: I18n.locale), class: 'btn btn-outline-primary')
      ].join(' ').html_safe
    end
  end
end
# frozen_string_literal: true

module AdminHelper
  def admin_editor_tools(main_path:, object: nil)
    tag.div(class: 'btn-group admin-editor-tools', role: 'group') do
      safe_join([
        new_button(main_path),
        edit_button(main_path, object),
        delete_button(main_path, object),
        index_button(main_path),
      ])
    end
  end

  def new_button(main_path)
    link_to(t('buttons.new'), public_send("new_#{main_path}_path", locale: I18n.locale), class: 'btn btn-info')
  end

  def edit_button(main_path, object)
    return unless object

    link_to(t('buttons.edit'), public_send("edit_#{main_path}_path", id: object, locale: I18n.locale), class: 'btn btn-primary')
  end

  def delete_button(main_path, object)
    return unless object

    button_to(t('buttons.destroy'), public_send("destroy_#{main_path}s_path", id: object, locale: I18n.locale), method: :delete, data: { "turbo-method": :delete, turbo_confirm: 'Are you sure you want to delete?' }, class: 'btn btn-danger')
  end

  def index_button(main_path)
    link_to(t('buttons.index'), public_send("#{main_path}s_path", locale: I18n.locale), class: 'btn btn-outline-primary')
  end
end

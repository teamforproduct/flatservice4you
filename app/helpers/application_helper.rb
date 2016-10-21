module ApplicationHelper
  def locale_swicher
    content_tag(:ul) do
      I18n.available_locales.each do |locale|
        concat content_tag(:li, (link_to locale.capitalize, root_path(locale: locale)), style: 'display: inline;padding: 0 10px;')
      end
    end
  end
end

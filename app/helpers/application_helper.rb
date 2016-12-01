module ApplicationHelper
  def locale_swicher
    parsed_locale = request.host.split('.').last

    if parsed_locale and I18n.available_locales.include?(parsed_locale.to_sym)
      path = request.host.split('.').first

      # TODO check on production(flatserviceforyou.pl, flatserviceforyou.de, flatservice4you.pl, flatservice4you.de)
      content_tag(:ul, class: 'dropdown-menu pull-right locale-dropdown') do
        I18n.available_locales.each do |locale|
          concat content_tag(:li, (link_to locale.capitalize, "http://#{path}.#{locale}"))
        end
      end
    else
      content_tag(:ul, class: 'dropdown-menu pull-right locale-dropdown') do
        I18n.available_locales.each do |locale|
          concat content_tag(:li, (link_to locale.capitalize, root_path(locale: locale)))
        end
      end
    end
  end

  def flash_class(type)
    valid_class = case type
                    when 'notice'
                      'info'
                    when 'error'
                      'danger'
                    when 'success'
                      'success'
                    else
                      'warning'
                  end

    "alert alert-#{valid_class}"
  end
end

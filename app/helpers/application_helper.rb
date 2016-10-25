module ApplicationHelper
  def locale_swicher
    if params[:locale]
      content_tag(:ul) do
        I18n.available_locales.each do |locale|
          concat content_tag(:li, (link_to locale.capitalize, root_path(locale: locale)), style: 'display: inline;padding: 0 10px;')
        end
      end
    else
      path, locale = request.host.split('.')

      # TODO check on production(flatserviceforyou.pl, flatserviceforyou.de, flatservice4you.pl, flatservice4you.de)
      if locale and I18n.available_locales.include?(locale.to_sym)
        content_tag(:ul) do
          I18n.available_locales.each do |locale|
            concat content_tag(:li, (link_to locale.capitalize, "http://#{path}.#{locale}"), style: 'display: inline;padding: 0 10px;')
          end
        end
      end
    end
  end
end

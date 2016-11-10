module HomeHelper
  def home_divider
    content_tag :div, id: 'home-divider' do
      content_tag :div, class: "container" do
        content_tag :div, class: "row" do
          content_tag :div, class: "col-md-3 col-sm-6 col-xs-6 pull-right" do
            content_tag :div, class: "menu-button" do
              link_to "#", class: "js-template-nt-nav-toggle template-nt-nav-toggle",
                      data: { toggle:"collapse", target: "#template-nt-navbar"},
                      aria: {expanded: "false", controls:"navbar"}  do
                content_tag(:span, t('menu_button')) + fa_icon('bars')
              end
            end
          end
        end
      end
    end.html_safe
  end
end

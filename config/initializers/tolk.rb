# encoding: utf-8

# Tolk config file. Generated on May 12, 2017 05:14
# See github.com/tolk/tolk for more informations

Tolk::ApplicationController.authenticator = proc {
  authenticate_or_request_with_http_basic do |user_name, password|
    user_name == 'translator' && password == 'transpassword'
  end
}

Tolk.config do |config|
  config.exclude_gems_token = true
  # exclude locales tokens from gems.

  config.block_xxx_en_yml_locale_files = true
  # reject files of type xxx.en.yml when syncing locales.

  # config.dump_path = '/new/path'
  # Dump locale path by default the locales folder (config/locales).

  # config.mapping['en'] = 'New English'
  # config.mapping['fr'] = 'New French'
  # Mapping : a hash of the type { 'ar' => 'Arabic' }.

  # config.primary_locale_name = 'de'
  # primary locale to not be overriden by default locale in development mode.

  # config.strip_texts = false
  # Don't strip translation texts automatically
end
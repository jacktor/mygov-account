source 'http://rubygems.org'

gem 'rails', '3.2.13'
gem 'mysql2'
gem 'jquery-rails'
gem 'json', '1.7.7'
gem 'haml'
gem 'devise'
gem 'capistrano'
gem 'omniauth'
gem 'oauth2-provider', :require => 'oauth2/provider', :git => 'https://github.com/GSA-OCSIT/oauth2-provider.git', :branch => 'bearer-header'
gem 'rvm-capistrano'
gem 'bigdecimal'
gem 'will_paginate', '~> 3.0'
gem 'cancan'
gem 'google-analytics-rails'
gem 'quiet_assets'
gem 'coffee-rails', '~> 3.2.1'
gem "airbrake"
gem 'maruku'
gem 'validates_email_format_of', :git => 'https://github.com/alexdunae/validates_email_format_of.git'
gem "permanent_records", "~> 2.3.0"
gem "httparty"
gem "paperclip", "~> 3.0"
gem "rabl"
gem 'rb-readline', '~> 0.4.2'
gem 'omniauth-openid', :git => 'https://github.com/GSA-OCSIT/omniauth-openid.git', :branch => 'pape'
gem 'omniauth-cas'

group :production do
  gem 'rack-openid', :git => 'https://github.com/GSA-OCSIT/rack-openid.git', :branch => 'pape'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '~> 0.11.1', :require => 'v8', :platform => :ruby
  gem 'libv8', '~> 3.11.8.7', :platform => :ruby
  gem 'execjs'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'oauth2'
  gem "brakeman", :require => false
  gem 'pry'
  gem 'pry-nav'
  gem 'guard'
  gem 'guard-rspec'
end

group :development do
  gem 'thin'
  gem 'haml-rails'
  gem 'hpricot'
  gem 'ruby_parser'
  gem "letter_opener"
  gem 'railroady'
  gem 'awesome_print'
end

group :test do
  gem 'capybara', '~> 1.1.4'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem 'webmock'
  gem 'zeus'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug'

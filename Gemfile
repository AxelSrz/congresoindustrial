source 'https://rubygems.org'
ruby '2.2.2'
gem 'rails', '4.2.2'
gem 'rake', '11.1.2'

################################################################################
# Assets
################################################################################
# Compilers & Engines
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'flavour_saver'
gem 'therubyracer'
gem 'bcrypt'
gem 'figaro'
gem 'mailgun-ruby', '~>1.0.2', require: 'mailgun'
gem 'delayed_job_active_record'
gem 'rails-i18n'
gem 'ransack'

# Javascript libraries
gem 'jquery-datatables-rails', '~> 3.1.1'
gem 'chartkick'
gem 'highcharts-rails', '~> 4.0.1'
gem 'twitter-typeahead-rails'
gem 'sweetalert-rails'
gem 'sweet-alert-confirm'
gem 'handlebars_assets'
gem 'momentjs-rails' # Time managing lib

# Styles
gem 'bootstrap-sass', '~> 3.3.1'
gem 'will_paginate-bootstrap'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
gem 'font-awesome-rails'
gem 'awesome_nested_fields'
# gem 'nprogress-rails'
# gem 'fullcalendar-rails'
gem 'slim'
gem 'paperclip', '~> 4.2'
gem 'jquery-minicolors-rails'
gem 'image-picker-rails'
gem 'bootstrap-wysihtml5-rails'
gem 'tinymce-rails'
gem 'jquery-ui-rails'
gem 'jquery-timepicker-addon-rails'
gem 'jquery-timepicker-rails'
source 'https://rails-assets.org' do
  gem 'rails-assets-datetimepicker'
end

################################################################################
# ActiveRecord
################################################################################
gem 'paranoia', '2.0.4'
gem 'paranoia_uniqueness_validator', '1.1.0'
gem 'paper_trail', '~> 3.0.2'
gem 'simple_form', '~> 3.1.0.rc2'
gem 'remotipart', '~> 1.2'
gem 'groupdate'
gem 'net-ssh'

###############################################################################
# UKKO's Gems
###############################################################################
# User authentication & session management
# Crud Controller
gem 'crud_controller', git: 'http://git.ukko.mx/ukko/crud_controller.git'

group :development, :test do
  # Testing
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'erd'
  gem 'rubocop'
  gem 'annotate'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'brakeman'
  gem 'pry-rails'
  gem 'simplecov'
end

gem 'pg'

gem 'fog', '~> 1.30.0'

gem 'rubyzip', '~> 1.1.7'

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor'
end
gem 'puma'
gem 'premailer-rails'
# gem 'sidekiq'
gem 'google-analytics-rails'

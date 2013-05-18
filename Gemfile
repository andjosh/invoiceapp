source "http://rubygems.org"

gem "rails"

gem "pg", :require => "pg"

gem "jquery-rails"
gem "devise"
gem "omniauth-facebook"
gem "kaminari"
gem "carrierwave"
gem "meta_search"
gem "dynamic_form"
gem "nested_form"
gem "heroku"
gem "coffee-rails"
gem "less-rails"
gem "twitter-bootstrap-rails"
gem 'newrelic_rpm'
gem 'wicked_pdf'
gem 'annotate'
gem "wkhtmltopdf"
gem "wkhtmltopdf-binary"
gem 'omniauth-stripe-connect'
gem 'figaro'
gem 'taps'


group :assets do
  gem "therubyracer", :platform => :ruby
end

group :test, :development do
  gem "rspec-rails"
  gem "spork-rails"
  gem "debugger"
  gem "awesome_print"
end

group :development do
  gem "chronic"
  gem "admin_view"
  gem "debugger"
  gem 'sqlite3'
end

group :test do
  gem "factory_girl_rails"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "capybara"
  gem "shoulda"
  gem "email_spec"
end

group :production, :development do
  gem "thin"
  gem "wkhtmltopdf-heroku"
end

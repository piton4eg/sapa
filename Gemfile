source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2.5'

group :production do
  gem 'pg',             '~> 0.18.4'
  gem 'rails_12factor', '~> 0.0.3'
end

group :development, :test do
  gem 'sqlite3',        '~> 1.3.11'
  gem 'rspec-rails',    '~> 3.4.0'

  gem 'better_errors', '~> 2.1.1'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'byebug'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :test do
  gem 'cucumber-rails', '~> 1.4.2', require: false
  gem 'database_cleaner', '~> 1.5.1'
  gem 'zeus'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-matchers', require: false
end

gem 'bootstrap-sass'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails-cdn'
gem 'jbuilder'

gem 'slim-rails'
gem 'carrierwave'
gem 'cloudinary'

gem 'bcrypt-ruby'
gem 'newrelic_rpm'
gem 'unf'
gem 'simple_form'
gem 'sorcery'
gem 'email_validator'
gem 'active_attr'

gem 'fancybox2-rails'
gem "jquery-fileupload-rails"
gem 'react-rails', '~> 1.5.0'

source 'https://rubygems.org'
ruby '2.1.3'

gem 'rails', '~> 4.1.7'

group :production do
  gem 'pg',             '~> 0.17.1'
  gem 'rails_12factor', '~> 0.0.3'
end

group :development, :test do
  gem 'sqlite3',        '~> 1.3.10'
  gem 'rspec-rails',    '~> 3.1.0'

  gem 'better_errors',  '~> 2.0.0'
  gem 'jazz_hands',     github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'factory_girl_rails', '~> 4.5.0'
end

group :test do
  gem 'cucumber-rails', '~> 1.4.2', require: false
  gem 'database_cleaner', '~> 1.3.0'
  gem 'zeus'
end

gem 'sass-rails',       '~> 4.0.4'
gem 'uglifier',         '~> 2.5.3'
gem 'coffee-rails',     '~> 4.0.1'
gem 'jquery-rails-cdn', '~> 1.0.3'
gem 'jbuilder',         '~> 2.1.3'

gem 'slim-rails',       '~> 2.1.5'
gem 'carrierwave',      '~> 0.10.0'
gem 'rmagick',          '~> 2.13.3', require: false
gem 'fog',              '~> 1.22.1'

gem 'bcrypt-ruby',      '~> 3.1.5'
gem 'newrelic_rpm',     '~> 3.8.1.221'
gem 'unf',              '~> 0.1.4'
gem 'simple_form',      '~> 3.0.2'
gem 'sorcery',          '~> 0.8.6'

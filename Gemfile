source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'devise'
gem 'ajaxful_rating', :git => 'git://github.com/edgarjs/ajaxful-rating.git', :branch => "rails3"
gem 'cancan'


group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'turn', :require => false
end

group :production do
  gem 'therubyracer'
  gem 'pg'
end

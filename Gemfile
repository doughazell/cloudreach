source 'https://rubygems.org'

######################################
# Ruby-2.5
######################################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '4.2.1'
# 28/10/20 DH: Running on High Sierra with Ruby-2.5 caused 'in <class:Numeric>': stack level too deep (SystemStackError)'
gem 'rails', '~> 4.2.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # 3/5/15 DH: RSpec testing gem additions to Rails generated Gemfile
  gem 'rspec-rails'
  gem 'capybara'

  # 28/10/20 DH: qt@5.5/5.5.1_1/lib/QtCore.framework/Headers/qglobal.h:39:12: fatal error: 'cstddef' file not found
  #             capybara-webkit (= 1.15.1) was resolved to 1.15.1, which depends on
  #               capybara (>= 2.3, < 4.0) was resolved to 3.33.0, which depends on
  #               Ruby (>= 2.5.0)
  #gem 'capybara-webkit'
  gem 'capybara-webkit', '1.15.1'

end

# 25/5/16 DH: Including FnordMetric railscast files
gem 'fnordmetric'
# 28/10/20 DH: yajl_ext.c:881:22: error: use of undeclared identifier 'rb_cFixnum'
gem 'yajl-ruby', '>= 1.3'

# 16/8/16 DH: Adding Bootstrap since Spree-3.0 has converted from Skeleton to Bootstrap
# 18/8/16 DH: 'bundle update' required...
gem 'twitter-bootstrap-rails'
gem 'therubyracer'
gem 'less-rails'

# 28/10/20 DH:
gem 'json', '1.8.6'



source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

gem 'bcrypt', '~> 3.1.7'


gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap', '~> 4.0.0.beta'
gem "font-awesome-rails"
gem "paperclip"
gem "figaro"
gem 'aws-sdk', '< 3.0'
gem 'newrelic_rpm'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'pry-rails'
gem 'rails_12factor'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'annotate'
  gem 'binding_of_caller'
  gem 'better_errors'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

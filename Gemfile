source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem "activesupport"
gem 'rails'
gem 'puma'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'public_suffix'
gem 'dotenv-rails', groups: [:development, :test]
gem 'rails_config'
gem 'bundler'
gem "binding_of_caller"
gem 'active_model_serializers'#, '~> 0.10.0'
gem 'pg'
gem 'pg_search'
gem 'activeadmin_addons'
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
source 'https://rails-assets.org' do
  gem 'rails-assets-tether'#, '>= 1.1.0'
end
gem 'acts_as_votable', github: 'ryanto/acts_as_votable'
gem 'has_friendship'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'remotipart'
gem 'paloma'#, '~> 5.0.0'
gem 'sass-rails'#, '~> 5'
gem 'bootstrap-sass'
gem 'bootstrap-select-rails'
gem 'bootstrap-multiselect-rails'
gem 'bootstrap-sass-extras'
gem 'devise', github: 'plataformatec/devise'
gem 'devise_invitable'
gem 'omniauth'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"
gem 'delayed_job_active_record'
gem 'paperclip'
gem 'braintree-rails', github: "lyang/braintree-rails", branch: 'master'
gem 'validates_timeliness'
gem 'validates_formatting_of'
group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

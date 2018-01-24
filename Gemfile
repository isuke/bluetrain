source 'https://rubygems.org'

ruby '2.5.0'

#
# Core
#
gem 'hanami'      , '~> 1.1'
gem 'hanami-model', '~> 1.1'
gem 'rake'

#
# DB
#
gem 'pg'

#
# View
#
gem 'slim'

#
# OAuth
#
gem 'omniauth-google-oauth2'

group :development do
  gem 'rubocop'
  gem 'shotgun'
end

group :test, :development do
  gem 'faker'
  gem 'hanami-fabrication'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'ruby-debug-ide', '0.6.0'

  #
  # for VSCode
  #
  gem 'debase', '0.2.2.beta14'
  gem 'dotenv', '~> 2.0'
  gem 'solargraph'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :production do
  # gem 'puma'
end

source 'https://rubygems.org'

ruby '2.4.2'

#
# Core
#
gem 'hanami',       '~> 1.1'
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

group :development do
  gem 'rubocop'
  gem 'shotgun'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'faker'
  gem 'hanami-fabrication'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
end

group :test do
  gem 'capybara'
  gem 'rspec'
end

group :production do
  # gem 'puma'
end

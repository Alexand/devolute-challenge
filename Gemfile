source 'https://rubygems.org'

# Padrino supports Ruby version 2.2.2 and later
# ruby '2.5.1'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'puma'# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
gem 'oj'

# Project requirements
gem 'rake'


# Component requirements
gem "activesupport", ">= 3.1"
gem "aws-sdk-s3"
gem "bcrypt"
gem 'rack-cors', require 'rack/cors'
gem "rack-parser", require: "rack/parser"
gem 'sass'
gem 'slim'
gem 'sequel'
gem "shrine", "~> 2.11"
gem "shrine-memory", "~> 0.3.0"
gem 'pg'

# Test requirements
group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem "factory_bot"
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

# Padrino Stable Gem
gem 'padrino', '0.14.3'
# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.14.3'
# end

source 'https://rubygems.org'

# Padrino supports Ruby version 2.2.2 and later
# ruby '2.5.1'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'puma'# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem "activesupport", ">= 3.1"
gem "bcrypt"
gem 'sass'
gem 'slim'
gem 'sqlite3'
gem 'sequel'

# Test requirements
group :development, :test do
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

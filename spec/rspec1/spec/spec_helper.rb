$: << File.join(File.dirname(__FILE__), "/../lib" )
$: << File.dirname(__FILE__)

ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] = 'app_root'

# Load the Rails environment and testing framework
require "#{File.dirname(__FILE__)}/../app_root/config/environment"
require 'spec/rails'

# Load dependencies
require 'rspec_candy/all'

# Require support code
Dir["../shared/support/**/*.rb"].each {|f| require f}

# Run the migrations
print "\033[30m" # dark gray text
ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")
print "\033[0m"

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
end

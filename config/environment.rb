# Load the rails application
require File.expand_path('../application', __FILE__)
config.gem 'redis' 

# Initialize the rails application
Gigiki::Application.initialize!

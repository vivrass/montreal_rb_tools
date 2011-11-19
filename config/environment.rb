# Load the rails application
require File.expand_path('../application', __FILE__)

require 'load_environment'
LoadEnvironment.load_keys_from_file

# Initialize the rails application
MontrealRbTools::Application.initialize!

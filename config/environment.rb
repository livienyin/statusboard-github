# Load the rails application
require File.expand_path('../application', __FILE__)

# YAML.load_file("/config/initializers/api_keys.yaml")[::Rails.env].each
# {|k,v| ENV[k]=v}

# Initialize the rails application
StatusboardGithub::Application.initialize!

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Directory::Application.initialize!

# Change date format
Date::DATE_FORMATS.merge!(:default => "%m/%d/%Y", :spouse => "%m/%d")


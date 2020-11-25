ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # added
  include Devise::Test::IntegrationHelpers
  #include Warden::Test::Helpers
  #include Devise::Controllers::Helpers  
  
 # def log_in(user)
 #   if integration_test?
 #     login_as(user, :scope => :user)
 #   else # controller and model tests
 #     sign_in(user)
 #   end
 # end

  # Add more helper methods to be used by all tests here...
end

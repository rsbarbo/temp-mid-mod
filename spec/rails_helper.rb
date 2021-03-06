ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end

def user_login(user)
  visit login_path
  fill_in "email", with: user.email
  fill_in "password", with: user.password
  click_button("Log In")
end

def create_link(link)
  fill_in "link_title", with: link[:link_title]
  fill_in "link_url", with: link[:link_url]
  click_button("Submit")
end

require "rails_helper"

RSpec.describe "User Sign Up" do
  describe "when user visit the root page" do
    it "expects to see the option to sign up" do
      # As an unauthenticated user
      # When I visit the root of the application "/"
      visit "/"
      expect(page).to have_content('Sign Up')
      # I should be redirected to a page which prompts me to "Log In or Sign Up".
    end
  end
end

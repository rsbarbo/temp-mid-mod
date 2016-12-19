require "rails_helper"

RSpec.describe "User Sign Up" do
  describe "when user visit the root page" do
    it "gets re-directed to the sign up page" do
      # As an unauthenticated user
      # When I visit the root of the application "/"
      visit "/"
      # I should be redirected to a page which prompts me to "Log In or Sign Up".
      expect(current_path).to eq("user_auth")
    end
  end
end

require "rails_helper"

RSpec.describe "User Sign Up" do
  describe "when user visit the root page" do
    it "expects to see the option to sign up" do
      # As an unauthenticated user
      # When I visit the root of the application "/"
      visit '/'
      expect(page).to have_content('Sign Up')
      # I should be redirected to a page which prompts me to "Log In or Sign Up".
    end
  end

  describe "when user click sign up" do
    it "gets redirect to the sign up page" do
      visit '/'
      click_link 'Sign Up'

      expect(current_path).to eq(signup_path)
    end

    it "expects page to have form to sign up" do
      visit signup_path

      expect(page).to have_content("Please Enter Name:")
      expect(page).to have_content("Please Enter Email:")
      expect(page).to have_content("Please Enter Password:")
      expect(page).to have_content("Please Confirm Password:")
    end
  end
end

require "rails_helper"

RSpec.describe "User Sign Up" do
  describe "when user visit the root page" do
    it "expects to see the option to sign up" do
      # As an unauthenticated user
      # When I visit the root of the application "/"
      visit '/'
      # I should be redirected to a page which prompts me to "Log In or Sign Up".
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign Up')
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

  it "creates the saves the user" do
    visit signup_path

    user = {name: "Raphael",
            email: "email@example.com",
            password: "password"}

    fill_in "user_name", with: user[:name]
    fill_in "user_email", with: user[:email]
    fill_in "user_password", with: user[:password]
    fill_in "user_password_confirmation", with: user[:password]

    click_button("Create Account")

    expect(current_path).to eq("/")
  end
end

require "rails_helper"

RSpec.describe "User Login" do
  describe "when user visit the root page" do
    it "expects to see the option to login" do
      # As an unauthenticated user
      # When I visit the root of the application "/"
      visit '/'
      # I should be redirected to a page which prompts me to "Log In or Sign Up".
      expect(page).to have_content('Login')
    end
  end

  describe "when user click login up" do
    it "gets redirect to the login page" do
      visit '/'
      click_link 'Login'

      expect(current_path).to eq(login_path)
    end

    it "expects page to have form to login" do
      visit login_path

      expect(page).to have_content("Please Enter Email:")
      expect(page).to have_content("Please Enter Password:")
    end
  end

  it "user can login and be directed to the correct page" do
    visit login_path

    user = create(:user)

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_button("Log In")

    expect(current_path).to eq("/")
  end

  it "user cannot login when password is wrong" do
    visit login_path

    user = create(:user)

    fill_in "email", with: user.email
    fill_in "password", with: "wrongpassword"

    click_button("Log In")

    expect(current_path).to eq("/login")
  end
end

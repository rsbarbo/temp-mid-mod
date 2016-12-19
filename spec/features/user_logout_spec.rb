require "rails_helper"

RSpec.describe "User Logout" do
  describe "when user click logout" do
    it "gets redirect to the login page" do
      user = create(:user)
      user_login(user)

      expect(page).to have_content('Logout')

      click_link 'Logout'

      expect(current_path).to eq(login_path)
    end
  end
end

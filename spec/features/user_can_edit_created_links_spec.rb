require "rails_helper"

RSpec.describe "Create Link" do
  describe "when user visit the root page" do
    it "expects to see the options to create a link" do

      user = create(:user)
      user_login(user)

      link = create(:link)

      visit "/links/#{link.id}/edit"

      expect(current_path).to eq("/links/#{link.id}/edit")

      expect(page.find_field('link_title').value).to eq( link.title )
      expect(page.find_field('link_url').value).to eq( link.url )

      fill_in "link_title", with: "New Title"
      fill_in "link_url", with: "https://www.youtube.com/"

      expect(page.find_field('link_title').value).to eq( "New Title" )
      expect(page.find_field('link_url').value).to eq( "https://www.youtube.com/" )

      click_on "Submit"

      expect(current_path).to eq("/")
    end
  end
end

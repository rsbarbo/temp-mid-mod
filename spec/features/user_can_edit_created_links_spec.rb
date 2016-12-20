require "rails_helper"

RSpec.describe "Create Link" do
  describe "when user visit the edit page for a link" do
    it "expects to be able to submit a new link as long as the link is valid" do

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
    it "expects not to be able to submit a new link when link is not valid" do

      user = create(:user)
      user_login(user)

      link = create(:link)

      visit "/links/#{link.id}/edit"

      expect(current_path).to eq("/links/#{link.id}/edit")

      expect(page.find_field('link_title').value).to eq( link.title )
      expect(page.find_field('link_url').value).to eq( link.url )

      fill_in "link_title", with: "New Title"
      fill_in "link_url", with: "youtube"

      expect(page.find_field('link_title').value).to eq( "New Title" )
      expect(page.find_field('link_url').value).to eq( "youtube" )

      click_on "Submit"

      expect(current_path).to eq("/links/#{link.id}/edit")

      expect(page.find_field('link_title').value).to eq( link.title )
      expect(page.find_field('link_url').value).to eq( link.url )
    end
  end
end

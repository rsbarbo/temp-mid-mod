require "rails_helper"

RSpec.describe "Create Link" do
  describe "when user visit the root page" do
    it "expects to see the options to create a link" do

      user = create(:user)
      user_login(user)

      expect(current_path).to eq("/")
      expect(page).to have_content("Title")
      expect(page).to have_content("Url")

      link_info = {link_title: "A Charlie Brown Christmas",
        link_url: "https://www.youtube.com/watch?v=GPG3zSgm_Qo"}


        fill_in "link_title", with: link_info[:link_title]
        fill_in "link_url", with: link_info[:link_url]

        click_button("Submit")

        expect(current_path).to eq("/")
        expect(page).to have_content( link_info[:link_title] )
        expect(page).to have_content( link_info[:link_title] )
      end

      it "expects not to see the link if url is not valid" do

        user = create(:user)
        user_login(user)

        expect(current_path).to eq("/")
        expect(page).to have_content("Title")
        expect(page).to have_content("Url")

        link_info = {link_title: "A Charlie Brown Christmas",
          link_url: "watch?v=GPG3zSgm_Qo"}


          fill_in "link_title", with: link_info[:link_title]
          fill_in "link_url", with: link_info[:link_url]

          click_button("Submit")

          expect(current_path).to eq("/")
          expect(page).not_to have_content( link_info[:link_title] )
          expect(page).not_to have_content( link_info[:link_title] )
        end
      end
    end

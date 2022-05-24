require 'rails_helper'

RSpec.describe "user show page" do
    it  'has a users dashboard' do
        frank = User.create!(name: "Frank", email: "frank@yahoo.com", password: "test", password_confirmation: "test")
        visit "/users/#{frank.id}"

        expect(page).to have_content("Frank's Dashboard")
        expect(page).to have_button("Discover Movies")
        expect(page).to have_content("Viewing Parties")
    end
    it 'has a button that takes the user to a discover page' do
      frank = User.create!(name: "Frank", email: "frank@yahoo.com", password: "test", password_confirmation: "test")
      visit "/users/#{frank.id}"

      click_on 'Discover Movies'
      expect(current_path).to eq("/users/#{frank.id}/discover")
    end
end

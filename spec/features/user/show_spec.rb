require 'rails_helper'

RSpec.describe "user show page" do 
    it  'has a users dashboard' do 
        frank = User.create!(name: "Frank", email: "frank@yahoo.com", password: "test", password_confirmation: "test")
        visit "/users/#{frank.id}"

        expect(page).to have_content("Frank's Dashboard")
        expect(page).to have_button("Discover Movies")
        expect(page).to have_content("Viewing Parties")
    end

end
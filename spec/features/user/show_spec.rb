require 'rails_helper'

RSpec.describe "user show page" do 
    it  'has a users dashboard' do 
        User.create!(name: "will", email: "will@g.com", password: "test", password_confirmation: "test")
        visit '/'
        click_button 'Log in'
        fill_in 'email', with: 'will@g.com'
        fill_in 'password', with: 'test'
        click_button 'Login'
        visit "/dashboard"

        expect(page).to have_content("will's Dashboard")
        expect(page).to have_button("Discover Movies")
        expect(page).to have_content("Viewing Parties")
    end

end
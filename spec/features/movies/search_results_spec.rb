require 'rails_helper'

RSpec.describe 'Search Results page ' do 
   it 'returns the search results of a single word search' do 
        user = User.create!(name: "will", email: "will@g.com", password: "test", password_confirmation: "test")
        visit '/'
        click_button 'Log in'
        fill_in 'email', with: 'will@g.com'
        fill_in 'password', with: 'test'
        click_button 'Login'

        visit "/discover"
        fill_in "search",	with: "Batman"
        click_button 'Search'
        expect(current_path).to eq('/movies/search_results')
        expect(page).to have_content("Batman Begins")
   end

   it 'returns the results from a multi word search' do 
        user = User.create!(name: "will", email: "will@g.com", password: "test", password_confirmation: "test")
        visit '/'
        click_button 'Log in'
        fill_in 'email', with: 'will@g.com'
        fill_in 'password', with: 'test'
        click_button 'Login'

        visit "/discover"
        fill_in "search",	with: "Mad Max"
        click_button 'Search'
        expect(current_path).to eq('/movies/search_results')
        expect(page).to have_content("Mad Max")
   end
end
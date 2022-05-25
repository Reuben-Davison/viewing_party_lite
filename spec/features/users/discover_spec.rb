require 'rails_helper'

RSpec.describe 'discover page' do
    it 'has a top rated movies link' do
        User.create!(name: "will", email: "will@g.com", password: "test", password_confirmation: "test")
        visit "/discover"
        click_button 'Top Movies'
        expect(current_path).to eq('/movies/top_movies')
        expect(page).to have_content("Top Movies")
        expect(page).to have_content("Shawshank Redemption - With an average rating of: 8.7")
        expect(page).to_not have_content("Fight Club")
        click_button 'Return to Discover Page'
        expect(current_path).to eq("/discover")
    end

end

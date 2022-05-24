require 'rails_helper'

RSpec.describe 'Creating a viewing party' do
    xit 'has a button to create a viewing party' do
        @user = User.create!(name: 'Chris', email: 'chris@gmail.com', password: "test", password_confirmation: "test")
        @user1 = User.create!(name: 'Rod', email: 'rod@gmail.com', password: "test", password_confirmation: "test")
        @user3 = User.create!(name: 'Frank', email: 'frink@gmail.com', password: "test", password_confirmation: "test")
        @user4 = User.create!(name: 'Sue', email: 'sue@gmail.com', password: "test", password_confirmation: "test")
        visit "/users/#{@user.id}/movies/862/viewing-party/new"
        @movie = MovieFacade.new(862)
        expect(page).to have_content(@movie.movie_details[:title])
        fill_in "duration",	with: "300" 
        fill_in "when",	with: "1/1/2020" 
        fill_in "start",	with: "6:00"
        check 'Sue'
        check 'Rod'
        click_button 'Create Party'
        expect(current_path).to eq("/users/#{@user.id}")
    end 

    xit 'also adds viewing party to all attendees' do 
        @user = User.create!(name: 'Chris', email: 'chris@gmail.com', password: "test", password_confirmation: "test")
        @user1 = User.create!(name: 'Rod', email: 'rod@gmail.com', password: "test", password_confirmation: "test")
        @user3 = User.create!(name: 'Frank', email: 'frink@gmail.com', password: "test", password_confirmation: "test")
        @user4 = User.create!(name: 'Sue', email: 'sue@gmail.com', password: "test", password_confirmation: "test")
        visit "/users/#{@user.id}/movies/862/viewing-party/new"
        @movie = MovieFacade.new(862)
        expect(page).to have_content(@movie.movie_details[:results][:original_title])
        fill_in "duration",	with: "300" 
        fill_in "when",	with: "1/1/2020" 
        fill_in "start",	with: "6:00"
        click_on 'Sue'
        click_on 'Rod'
        click_button 'Create Party'
        visit "/users/#{@user1.id}"
        expect(page).to have_content("Viewing parties")
    end
        

end 
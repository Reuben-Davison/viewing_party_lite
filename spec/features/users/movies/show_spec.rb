require 'rails_helper'

RSpec.describe 'Movie detail page' do
  before(:each) do
    @user = User.create!(name: 'Chris', email: 'chris@gmail.com', password: "test", password_confirmation: "test")
    visit "/users/#{@user.id}/movies/862"
  end

it 'has a button to create a viewing party' do
  click_button 'Create Viewing Party'
  expect(current_path).to eq("/users/#{@user.id}/movies/862/viewing-party/new")
end
  it 'displays movie details' do
    expect(page).to have_content('Toy Story')
    expect(page).to have_content('Vote Average: 8.0')
    expect(page).to have_content('Runtime: 1 hour(s) and 21 minutes')
    expect(page).to have_content('Animation')
    expect(page).to have_content('Adventure')
    expect(page).to have_content('Family')
    expect(page).to have_content('Comedy')
    expect(page).to have_content("Led by Woody, Andy's toys live happily in his room until Andy's birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy's heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.")
    expect(page).to have_content('Tom Hanks')
    expect(page).to have_content('Woody')
    expect(page).to have_content('Tim Allen')
    expect(page).to have_content('Buzz Lightyear')
    expect(page).to have_content('Don Rickles')
    expect(page).to have_content('Mr. Potato Head')
    expect(page).to have_content('Jim Varney')
    expect(page).to have_content('Slinky Dog')
    expect(page).to have_content('Wallace Shawn')
    expect(page).to have_content('Rex')
    expect(page).to have_content('John Ratzenberger')
    expect(page).to have_content('Hamm')
    expect(page).to have_content('Annie Potts')
    expect(page).to have_content('Bo Peep')
    expect(page).to have_content('Andy')
    expect(page).to have_content('Erik von Detten')
    expect(page).to have_content('Sid')
    expect(page).to have_content('Laurie Metcalf')
    expect(page).to have_content('Mrs. Davis')
    expect(page).to have_content('Total Reviews: 3')
    expect(page).to have_content('Gimly')
    expect(page).to have_content('Ruuz')
    expect(page).to have_content('Rating: 8.0')
    expect(page).to have_content('JPV852')
    expect(page).to have_content('Rating: 9.0')
    expect(page).to have_content('r96sk')
    expect(page).to have_content('Rating: 10.0')
  end
  it 'has a button to the discover page' do
    click_button 'Discover Page'
    expect(current_path).to eq("/users/#{@user.id}/discover")
  end
end

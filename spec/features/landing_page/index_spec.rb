require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'displays the application title, new user button, users and landing page link' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: "test", password_confirmation: "test")
    user_2 = User.create!(name: 'Sally', email:'sally@gmail.com', password: "test", password_confirmation: "test")

    visit '/'
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to have_button('Create New User')

    within "#user-#{user_1.id}" do
      expect(page).to have_content('charlie@gmail.com')
      expect(page).to_not have_content('sally@gmail.com')
      click_link "charlie@gmail.com's Dashboard"
      expect(current_path).to eq("/users/#{user_1.id}")
    end

    visit '/'
    within "#user-#{user_2.id}" do
      expect(page).to have_content('sally@gmail.com')
      expect(page).to_not have_content('charlie@gmail.com')
      click_link "sally@gmail.com's Dashboard"
      expect(current_path).to eq("/users/#{user_2.id}")
    end

    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it 'has a log in link' do 
    user = create(:user)
    visit '/'
    click_on 'Log in'
    expect(current_path).to eq('/login')
  end

end

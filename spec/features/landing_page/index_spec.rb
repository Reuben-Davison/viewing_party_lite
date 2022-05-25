require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'displays the application title, new user button, users and landing page link' do
    user_1 = User.create!(name: 'Charles', email:'charlie@gmail.com', password: "test", password_confirmation: "test")
    user_2 = User.create!(name: 'Sally', email:'sally@gmail.com', password: "test", password_confirmation: "test")
    visit '/register'
    
    fill_in "name",	with: "Rupert" 
    fill_in "email",	with: "rupert@gmail.com" 
    fill_in "password",	with: "password1" 
    fill_in "password_confirmation",	with: "password1" 
    click_button 'Register'
    visit '/'
    expect(page).to have_content('Viewing Party Lite')
    expect(page).to_not have_button('Create New User')

    within "#user-#{user_1.id}" do
      expect(page).to have_content('charlie@gmail.com')
      expect(page).to_not have_content('sally@gmail.com')
    end

    visit '/'
    within "#user-#{user_2.id}" do
      expect(page).to have_content('sally@gmail.com')
      expect(page).to_not have_content('charlie@gmail.com')
    end

    visit '/'
    click_link 'Home'
    expect(current_path).to eq('/')
  end

  it 'has a log in link' do 
    create(:user)
    visit '/'
    click_on 'Log in'
    expect(current_path).to eq('/login')
  end

  it 'displays log out link for a logged in user and user can log out ' do 
        visit '/register'
        
        fill_in "name",	with: "Rupert" 
        fill_in "email",	with: "rupert24@gmail.com" 
        fill_in "password",	with: "password1" 
        fill_in "password_confirmation",	with: "password1" 
        click_button 'Register'
        visit '/'
        expect(page).to_not have_content("Log in")
        expect(page).to have_button("Log out")

        click_button "Log out"
        expect(current_path).to eq('/')
        expect(page).to have_button("Log in")

  end

end

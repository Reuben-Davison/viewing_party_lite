require 'rails_helper'

RSpec.describe "register page" do 
    it  'has a page to register' do 

        visit '/register'
        
        fill_in "name",	with: "Rupert" 
        fill_in "email",	with: "rupert@gmail.com" 
        fill_in "password",	with: "password1" 
        fill_in "password_confirmation",	with: "password1" 
        click_button 'Register'
        binding.pry
        rup = User.first
        expect(current_path).to eq("/users/#{rup.id}")
        expect(page).to have_content("Rupert's Dashboard")
    end
    it  'sad path test for misspelling a confirmation password' do 

        visit '/register'
        
        fill_in "name",	with: "Rob" 
        fill_in "email",	with: "rut@gmail.com" 
        fill_in "password",	with: "password1" 
        fill_in "password_confirmation",	with: "password" 
        click_button 'Register'
        
        expect(current_path).to eq("/register")
        expect(page).to have_content("Password confirmation doesn't match")
    end

end
require 'rails_helper'

RSpec.describe 'login page' do 
    it 'has a form to log in user' do
        user = User.create!(name: "toim", 
                            email: "tommy@gamil.com", 
                            password: "test", 
                            password_confirmation: "test")

        visit '/login'
        fill_in "email",	with: "tommy@gamil.com" 
        fill_in "password",	with: "test"
        click_button 'Login'

        expect(current_path).to eq("/users/#{user.id}/discover")


        
    end
end
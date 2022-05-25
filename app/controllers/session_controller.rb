class SessionController < ApplicationController 
    def delete
        session.destroy
        redirect_to '/'
    end
end 

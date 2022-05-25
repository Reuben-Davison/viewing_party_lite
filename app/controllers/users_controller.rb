class UsersController < ApplicationController 
    def new 
    end

    def show
  
    end

    def create 
        user = User.create(user_params)
        session[:user_id] = user.id
        if user.save
            redirect_to "/dashboard"
        else 
            redirect_to '/register'
            flash[:alert] = user.errors.full_messages
        end 
    end
  
    def discover
    end

    def login_form
    end

    def login_user 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to "/dashboard/discover"
        else 
          flash[:alert] = "Invalid username or password"
           redirect_to '/login'
        end
    end

    private 
    def user_params 
        params.permit(:name, :email, :password, :password_confirmation)
    end
end

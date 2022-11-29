class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        p user
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Logged in'
        else
            flash[:notice] = 'Invalid email or password'
            render :new
        end
    end
    
    
    def destroy
        p "hello"
        session[:user_id] = nil
        redirect_to root_path, notice: "logged out"
    end

end
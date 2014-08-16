class UsersController < Application_Controller

    def select
        @users = User.all
    end

    def change
        session[:selected_user] = params[:selected_user]
        redirect_to games_path
    end
end

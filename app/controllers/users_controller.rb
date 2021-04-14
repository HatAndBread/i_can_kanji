class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        update_user_frontend(current_user)
    end
end

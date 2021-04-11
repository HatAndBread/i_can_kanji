class PagesController < ApplicationController
    def home
        puts "Oh yeah!"
        p current_user
        render json: {status: 'awesome'}
    end
end

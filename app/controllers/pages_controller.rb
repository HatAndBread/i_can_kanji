class PagesController < ApplicationController
    def home
        puts "Oh yeah!"
        render json: {status: 'awesome'}
    end
end

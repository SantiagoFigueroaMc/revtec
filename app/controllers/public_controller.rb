class PublicController < ApplicationController
    def home
        @clients = Client.all
    end
end

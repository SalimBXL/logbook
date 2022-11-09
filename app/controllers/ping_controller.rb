class PingController < ApplicationController
    skip_before_action :authenticate, only: [:index]
  
    def index
        render json: { message: "Pong!" }, status: :ok
    end
end
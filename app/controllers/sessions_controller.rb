class SessionsController < ApplicationController
  def create
    player = Player.find_by(username: params[:username])
    if player&.authenticate(params[:password])
      render json: { token: '123' }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
end


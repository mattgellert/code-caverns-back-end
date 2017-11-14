module Api
  module V1
    class UsersController < ApplicationController

      def history
        @user = User.find_by(username: params[:username])
        if @user
          @games = Game.all.where(user_id: @user.id)
          render json: {
              games: @games
            }
        else
          render json: {error: "Username does not exist. Try another or start a new game."}
        end
      end

      def resume_game
        @challenge = Challenge.find_by(id: params[:challenge_id])
        render json: {
          challenge: @challenge
        }
      end

      def save_game
        @user = User.find_or_create_by(username: params[:username])
        if params[:challenge_id]
          @challenge = Challenge.find(params[:challenge_id])
          @challenge.update(data: params[:challenge], xPos: params[:xPos], yPos: params[:yPos], mapDeltaX: params[:mapDeltaX], mapDeltaY: params[:mapDeltaY])
          @game = Game.find_by(challenge_id: @challenge.id)
        else
          @challenge = Challenge.create(data: params[:challenge], xPos: params[:xPos], yPos: params[:yPos], mapDeltaX: params[:mapDeltaX], mapDeltaY: params[:mapDeltaY])
          @game = Game.create(user_id: @user.id, challenge_id: @challenge.id)
        end
        render json: @game
      end

    end
  end
end

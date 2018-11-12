# frozen_string_literal: true

class Tests::ListController < ApplicationController
  before_action :joined?
  # before_action :set_month
  # before_action :set_team_users
  # # GET /teams
  # # GET /teams.json
  # def index
  #   @teams = Team.all
  # end
  
  # GET /teams/1
  # GET /teams/1.json
  def show
    @team          = Team.find(params[:team_id])
    @month         = Date.parse("#{params[:id]}01")
    @team_users    = TeamUser.eager_load(:user).team_id(@team.id).all
    @user_emotions = UserEmotion.team_id(@team.id).eager_load(:emotion).reported_on_between(@month).all
    @user_emotion  = UserEmotion.new
  end

  private
    def joined?
      unless TeamUser.joined?(team_id: params[:team_id], user_id: current_user.id)
        respond_to do |format|
          format.html { redirect_back_page(alerts: "404") }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    end
end

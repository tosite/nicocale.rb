# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team,      only: [:show, :update, :join, :destroy]
  # before_action :set_team_user, only: [:show]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @user_emotion = current_user.user_emotions.new
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  # def edit
  #   # @new_team = Team.new
  # end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        @team.team_users.create!(user_id: current_user.id)
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_back_page(alerts: @team.errors) }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    respond_to do |format|
      if @team.team_users.create(user_id: current_user.id)
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { redirect_back_page(alerts: @team.errors) }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { redirect_back_page(alerts: @team.errors) }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_back_page(notice: "success!") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # def set_team_user
    #   @team_user = current_user.team_users.find_by(team_id: params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description, :avatar)
    end
end

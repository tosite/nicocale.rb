# frozen_string_literal: true

class UserEmotionsController < ApplicationController
  before_action :set_user_emotion, only: [:update, :destroy]
  before_action :set_team_user# ,    only: [:create]
  before_action :set_team_user# ,    only: [:create]

  # POST /user_emotions
  # POST /user_emotions.json
  def create
    @user_emotion = current_user.team_user(params[:team_id]).user_emotions.new(user_emotion_params)
    respond_to do |format|
      if @user_emotion.save
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :created, location: @user_emotion }
      else
        format.html { redirect_back_page(alerts: @user_emotion.errors) }
        format.json { render json: @user_emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_emotions/1
  # PATCH/PUT /user_emotions/1.json
  def update
    respond_to do |format|
      if @user_emotion.update(user_emotion_params)
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :ok, location: @user_emotion }
      else
        format.html { redirect_back_page(alerts: @user_emotion.errors) }
        format.json { render json: @user_emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /api/teams/:team_id/emotions/:emotion_id
  # params
  def modify
    team          = Team.find(params[:team_id])
    emotion       = Emotion.find(params[:emotion_id])
    team_user     = current_user.team_users.team_id(team.id).first
    description ||= params[:description]
    reported_on   = (params[:reported_on].nil?) ? Date.current : params[:reported_on]

    u = UserEmotion.find_or_create_by(team_user_id: team_user.id, reported_on: reported_on)
    u.emotion_id  = emotion.id
    u.team_id     = team_user.team_id
    u.user_id     = team_user.user_id
    u.description = description unless description.nil?

    respond_to do |format|
      if u.save
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :ok, location: @user_emotion }
      else
        format.html { redirect_back_page(alerts: "errors!") }
        format.json { render json: @user_emotion.errors, status: :unprocessable_entity }
      end    end
  end

  # DELETE /user_emotions/1
  # DELETE /user_emotions/1.json
  def destroy
    @user_emotion.destroy
    respond_to do |format|
      format.html { redirect_back_page(notice: "success!") }
      format.json { head :no_content }
    end
  end

  private
    def set_user_emotion
      @user_emotion = current_user.user_emotions.find(params[:id])
    end

    def user_emotion_params
      p = params.require(:user_emotion).permit(:emotion_id, :description, :reported_on)
      p[:user_id] = @team_user.user_id
      p[:team_id] = @team_user.team_id
      p
    end

    def set_team_user
      @team_user = current_user.team_users.team_id(params[:team_id]).first
    end
end

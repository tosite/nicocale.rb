# frozen_string_literal: true

class UserEmotionsController < ApplicationController
  before_action :set_user_emotion, only: [:show, :edit, :update, :destroy]

  # GET /user_emotions
  # GET /user_emotions.json
  def index
    @user_emotions = UserEmotion.all
  end

  # GET /user_emotions/1
  # GET /user_emotions/1.json
  def show
  end

  # GET /user_emotions/new
  def new
    @user_emotion = UserEmotion.new
  end

  # GET /user_emotions/1/edit
  def edit
  end

  # POST /user_emotions
  # POST /user_emotions.json
  def create
    @user_emotion = UserEmotion.new(user_emotion_params)

    respond_to do |format|
      if @user_emotion.save
        format.html { redirect_to @user_emotion, notice: "User emotion was successfully created." }
        format.json { render :show, status: :created, location: @user_emotion }
      else
        format.html { render :new }
        format.json { render json: @user_emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_emotions/1
  # PATCH/PUT /user_emotions/1.json
  def update
    respond_to do |format|
      if @user_emotion.update(user_emotion_params)
        format.html { redirect_to @user_emotion, notice: "User emotion was successfully updated." }
        format.json { render :show, status: :ok, location: @user_emotion }
      else
        format.html { render :edit }
        format.json { render json: @user_emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_emotions/1
  # DELETE /user_emotions/1.json
  def destroy
    @user_emotion.destroy
    respond_to do |format|
      format.html { redirect_to user_emotions_url, notice: "User emotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_emotion
      @user_emotion = UserEmotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_emotion_params
      params.require(:user_emotion).permit(:emotion_id, :team_user_id, :user_id, :team_id, :comment)
    end
end

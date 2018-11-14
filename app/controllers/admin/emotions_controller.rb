# frozen_string_literal: true

class Admin::EmotionsController < ApplicationController
  before_action :set_emotion, only: [:show, :edit, :update, :destroy]

  # GET /emotions
  # GET /emotions.json
  def index
    @emotions = Emotion.all
  end

  # GET /emotions/new
  def new
    @emotion = Emotion.new
  end

  # GET /emotions/1/edit
  def edit
  end

  # POST /emotions
  # POST /emotions.json
  def create
    @emotion = Emotion.new(emotion_params)

    respond_to do |format|
      if @emotion.save
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :created, location: @emotion }
      else
        format.html { redirect_back_page(alerts: @emotion.errors) }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emotions/1
  # PATCH/PUT /emotions/1.json
  def update
    respond_to do |format|
      if @emotion.update(emotion_params)
        format.html { redirect_back_page(notice: "success!") }
        format.json { render :show, status: :created, location: @emotion }
      else
        format.html { redirect_back_page(alerts: @emotion.errors) }
        format.json { render json: @emotion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_emotion
      @emotion = Emotion.find(params[:id])
    end

    def emotion_params
      params.require(:emotion).permit(:score, :name, :avatar)
    end
end

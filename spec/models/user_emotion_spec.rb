# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserEmotion, type: :model do
  before do
    user = User.new(email: "user@example.com", password: "password")
    user.skip_confirmation!
    user.save
  end
  let(:e_params)  { { emotion_id: 1, team_user_id: team_user.id, user_id: user.id, team_id: team.id, description: "description", reported_on: "2018-01-01" } }
  let(:team_user) { user.team_users.create(team_id: team.id) }
  let(:team)      { Team.create(g_params) }
  let(:g_params)  { { name: "team" } }
  let(:user)      { User.first }
  context "正常系" do
    it "単数" do
      team_user.user_emotions.create(e_params)
      expect(team_user.user_emotions.size).to eq 1
    end

    it "複数" do
      5.times { |i|
        team_user.user_emotions.create(e_params)
      }
      expect(team_user.user_emotions.size).to eq 5
    end

    context "description" do
      it "日本語" do
        e_params[:description] = "あ" * 200
        UserEmotion.create(e_params)
        expect(team_user.user_emotions.size).to eq 1
      end
    end
  end

  context "異常系" do
    context "team_user_id" do
      it "存在しない" do
        e_params[:team_user_id] = -100
        expect(UserEmotion.create(e_params).errors[:team_user_id].size).to eq 1
      end
    end
    context "team_id" do
      it "存在しない" do
        e_params[:team_id] = -100
        expect(UserEmotion.create(e_params).errors[:team_id].size).to eq 1
      end
    end
    context "user_id" do
      it "存在しない" do
        e_params[:user_id] = -100
        expect(UserEmotion.create(e_params).errors[:user_id].size).to eq 1
      end
    end
    context "reported_on" do
      it "空白" do
        e_params[:reported_on] = ""
        expect(UserEmotion.create(e_params).errors[:reported_on].size).to eq 1
      end
      it "無効" do
        e_params[:reported_on] = "9999-99-99"
        expect(UserEmotion.create(e_params).errors[:reported_on].size).to eq 1
      end
    end
    context "description" do
      it "長すぎる" do
        e_params[:description] = "a" * 500
        expect(UserEmotion.create(e_params).errors[:description].size).to eq 1
      end
    end
  end
end

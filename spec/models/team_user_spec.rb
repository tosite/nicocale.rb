# frozen_string_literal: true

require "rails_helper"

RSpec.describe TeamUser, type: :model do
  before do
    user = User.new(email: "user@example.com", password: "password")
    user.skip_confirmation!
    user.save
  end
  let(:team)    { Team.create(g_params) }
  let(:g_params) { { name: "team" } }
  let(:user)     { User.first }
  context "正常系" do
    it "単数" do
      user.team_users.create(team_id: team.id)
      expect(user.team_users.size).to eq 1
    end
    it "複数" do
      5.times { |i|
        g_params[:name] = "team-#{i + 1}"
        user.team_users.create(team_id: team.id)
      }
      expect(user.team_users.size).to eq 5
    end
  end
  context "異常系" do
      it "存在しないteam_id" do
        expect(user.team_users.create(team_id: -100).errors[:team_id].size).to eq 1
      end
      it "存在しないuser_id" do
        expect(team.team_users.create(user_id: -100).errors[:user_id].size).to eq 1
      end
    end
end

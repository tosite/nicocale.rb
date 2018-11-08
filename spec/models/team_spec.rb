# frozen_string_literal: true

require "rails_helper"

RSpec.describe Team, type: :model do
  describe "異常系" do
    let(:team)  { Team.create(params) }
    let(:params) { { name: "team-1" } }
    context "名前" do
      it "空白" do
        params[:name] = ""
        expect(team.errors[:name].size).to eq 1
      end
      it "長い" do
        params[:name] = "a" * 21
        expect(team.errors[:name].size).to eq 1
      end
    end
  end
end

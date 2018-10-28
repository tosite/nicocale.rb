# frozen_string_literal: true

require "rails_helper"

RSpec.describe Group, type: :model do
  describe "異常系" do
    let(:group)  { Group.create(params) }
    let(:params) { { name: "group-1" } }
    context "名前" do
      it "空白" do
        params[:name] = ""
        expect(group.errors[:name].size).to eq 1
      end
      it "長い" do
        params[:name] = "a" * 21
        expect(group.errors[:name].size).to eq 1
      end
    end
  end
end

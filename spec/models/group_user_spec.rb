# frozen_string_literal: true

require "rails_helper"

RSpec.describe GroupUser, type: :model do
  before do
    user = User.new(email: "user@example.com", password: "password")
    user.skip_confirmation!
    user.save
  end
  let(:group)    { Group.create(g_params) }
  let(:g_params) { { name: "group" } }
  let(:user)     { User.first }
  context "正常系" do
    it "単数" do
      user.group_user.create(group_id: group.id)
      expect(user.group_user.size).to eq 1
    end
    it "複数" do
      5.times { |i|
        g_params[:name] = "group-#{i + 1}"
        user.group_user.create(group_id: group.id)
      }
      expect(user.group_user.size).to eq 5
    end
  end
  context "異常系" do
      it "存在しないgroup_id" do
        expect(user.group_user.create(group_id: -100).errors[:group_id].size).to eq 1
      end
      it "存在しないuser_id" do
        expect(group.group_user.create(user_id: -100).errors[:user_id].size).to eq 1
      end
    end
end

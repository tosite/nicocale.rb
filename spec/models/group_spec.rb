require 'rails_helper'

RSpec.describe Group, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "異常系" do
    let(:group)  { Group.create(params) }
    let(:params) { { name: "group-1" } }
    context "名前" do
      it "空白" do
        params.merge!(name: "")
        expect(group.errors[:name].size).to eq 1
      end
      it "長い" do
        params.merge!(name: "a" * 21)
        expect(group.errors[:name].size).to eq 1
      end
      it "インジェクション" do
        params.merge!(name: "<a href='test.com'></a>")
        group
        debugger
      end
    end
  end
end

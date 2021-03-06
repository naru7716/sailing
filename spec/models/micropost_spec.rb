require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { create(:micropost) }
  let!(:micropost_yesterday) { create(:micropost, :yesterday) }
  let!(:micropost_one_week_ago) { create(:micropost, :one_week_ago) }
  let!(:micropost_one_month_ago) { create(:micropost, :one_month_ago) }

  context "バリデーション" do
    it "有効な状態であること" do
      expect(micropost).to be_valid
    end

    it "名前がなければ無効な状態であること" do
      micropost = build(:micropost, name: nil)
      micropost.valid?
      expect(micropost.errors[:name]).to include("を入力してください")
    end

    it "名前が30文字以内であること" do
      micropost = build(:micropost, name: "あ" * 31)
      micropost.valid?
      expect(micropost.errors[:name]).to include("は30文字以内で入力してください")
    end

    it "内容が140文字以内であること" do
      micropost = build(:micropost, description: "あ" * 141)
      micropost.valid?
      expect(micropost.errors[:description]).to include("は140文字以内で入力してください")
    end

    it "チーム名が20文字以内であること" do
      micropost = build(:micropost, team: "あ" * 21)
      micropost.valid?
      expect(micropost.errors[:team]).to include("は20文字以内で入力してください")
    end

    it "ユーザーIDがなければ無効な状態であること" do
      micropost = build(:micropost, user_id: nil)
      micropost.valid?
      expect(micropost.errors[:user_id]).to include("を入力してください")
    end

    it "風向風速が30文字以内であること" do
      micropost = build(:micropost, wind: "あ" * 31)
      micropost.valid?
      expect(micropost.errors[:wind]).to include("は30文字以内で入力してください")
    end

    it "整備が50文字以内であること" do
      micropost = build(:micropost, maintenance: "あ" * 51)
      micropost.valid?
      expect(micropost.errors[:maintenance]).to include("は50文字以内で入力してください")
    end

    it "人気度が1以上でなければ無効な状態であること" do
      micropost = build(:micropost, time: 0)
      micropost.valid?
      expect(micropost.errors[:time]).to include("は1以上の値にしてください")
    end

    it "練習時間が10以下でなければ無効な状態であること" do
      micropost = build(:micropost, time: 11)
      micropost.valid?
      expect(micropost.errors[:time]).to include("は10以下の値にしてください")
    end
  end

  context "並び順" do
    it "最も最近の投稿が最初の投稿になっていること" do
      expect(micropost).to eq Micropost.first
    end
  end
end
require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  let(:user) { create(:user) }
  let(:micropost) { create(:micropost, user: user) }

  describe "投稿作成ページ" do
    before do
      login_for_system(user)
      visit new_micropost_path
    end

    context "ページレイアウト" do
      it "「投稿作成」の文字列が存在すること" do
        expect(page).to have_content '投稿作成'
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('投稿作成')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'タイトル'
        expect(page).to have_content '内容'
        expect(page).to have_content 'チーム名'
        expect(page).to have_content '風向風速'
        expect(page).to have_content '整備箇所'
        expect(page).to have_content '練習時間'
      end
    end

    context "投稿作成処理" do
      it "有効な情報で投稿作成を行うと投稿作成、成功のフラッシュが表示されること" do
        fill_in "タイトル", with: "大会１ヶ月前"
        fill_in "内容（練習メニューなど）", with: "レース艇のセッティングの見直しを海上で行った。"
        fill_in "チーム名", with: "あああ大学"
        fill_in "風向風速", with: "南南東"
        fill_in "練習時間", with: "5"
        fill_in "整備箇所", with: "グースネック交換"
        click_button "登録する"
        expect(page).to have_content "投稿が作成されました！"
      end

      it "無効な情報で投稿作成を行うと投稿作成、投稿作成失敗のフラッシュが表示されること" do
        fill_in  "タイトル", with: ""
        fill_in "内容（練習メニューなど）", with: "レース艇のセッティングの見直しを海上で行った。"
        fill_in "チーム名", with: "あああ大学"
        fill_in "風向風速", with: "南南東"
        fill_in "練習時間", with: "5"
        fill_in "整備箇所", with: "グースネック交換"
        click_button "登録する"
        expect(page).to have_content "Nameを入力してください"
      end
    end
  end

  describe "投稿詳細ページ" do
    context "ページレイアウト" do
      before do
        login_for_system(user)
        visit micropost_path(micropost)
      end

      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title("#{micropost.name}")
      end

      it "投稿情報が表示されること" do
        expect(page).to have_content micropost.name
        expect(page).to have_content micropost.description
        expect(page).to have_content micropost.team
        expect(page).to have_content micropost.time
        expect(page).to have_content micropost.maintenance
        expect(page).to have_content micropost.wind
      end
    end
  end
end

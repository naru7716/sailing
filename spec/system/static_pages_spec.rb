require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  describe "トップページ" do
    context "ページ全体" do
      before do
        visit root_path
      end

      it "Enjoy Sailingの文字列が存在することを確認" do
        expect(page).to have_content 'Enjoy Sailing'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title
      end
    end

    context "投稿フィード", js: true do
      let!(:user) { create(:user) }
      let!(:micropost) { create(:micropost, user: user) }

      it "投稿のぺージネーションが表示されること" do
        login_for_system(user)
        create_list(:micropost, 6, user: user)
        visit root_path
        expect(page).to have_content "みんなの投稿 (#{user.microposts.count})"
        expect(page).to have_css "div.pagination"
        Micropost.take(5).each do |d|
          expect(page).to have_link d.name
        end
      end
    end
  end

  describe "ヘルプページ" do
    before do
      visit about_path
    end

    it "Enjoy Sailingとは？の文字列が存在することを確認" do
      expect(page).to have_content 'Enjoy Sailingとは？'
    end

    it "正しいタイトルが表示されることを確認" do
      expect(page).to have_title full_title('使い方')
    end
  end
end

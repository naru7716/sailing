require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "ユーザー登録ページ" do
    before do
      visit signup_path
    end

    context "ページレイアウト" do
      it "「Sailor登録」の文字列が存在することを確認" do
        expect(page).to have_content 'Sailor登録'
      end

      it "正しいタイトルが表示されることを確認" do
        expect(page).to have_title full_title('Sailor登録')
      end
    end
  end
end

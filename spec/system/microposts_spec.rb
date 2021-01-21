require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:micropost) { create(:micropost, :picture, user: user) }
  let!(:comment) { create(:comment, user_id: user.id, micropost: micropost) }

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
        attach_file "micropost[picture]", "#{Rails.root}/spec/fixtures/test_micropost.jpg"
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

    context "投稿の削除", js: true do
      it "削除成功のフラッシュが表示されること" do
        login_for_system(user)
        visit micropost_path(micropost)
        click_link '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '投稿が削除されました'
      end
    end
  end

  describe "投稿編集ページ" do
    before do
      login_for_system(user)
      visit micropost_path(micropost)
      click_link "編集"
    end

    context "ページレイアウト" do
      it "正しいタイトルが表示されること" do
        expect(page).to have_title full_title('投稿の編集')
      end

      it "入力部分に適切なラベルが表示されること" do
        expect(page).to have_content 'タイトル'
        expect(page).to have_content 'チーム名'
        expect(page).to have_content '内容'
        expect(page).to have_content '風向風速'
        expect(page).to have_content '練習時間'
        expect(page).to have_content '整備箇所'
      end
    end

    context "投稿の更新処理" do
      it "有効な更新" do
        fill_in "タイトル", with: "編集：大会１ヶ月前"
        fill_in "チーム名", with: "編集：あああ大学"
        fill_in "内容（練習メニューなど）", with: "レース艇のセッティングの見直しを海上で行った。"
        fill_in "風向風速", with: "編集：南南東"
        fill_in "練習時間", with: 10
        fill_in "整備箇所", with: "編集：グースネック交換"
        attach_file "micropost[picture]", "#{Rails.root}/spec/fixtures/test_micropost2.jpg"
        click_button "更新する"
        expect(page).to have_content "投稿が更新されました！"
        expect(micropost.reload.name).to eq "編集：大会１ヶ月前"
        expect(micropost.reload.team).to eq "編集：あああ大学"
        expect(micropost.reload.description).to eq "レース艇のセッティングの見直しを海上で行った。"
        expect(micropost.reload.wind).to eq "編集：南南東"
        expect(micropost.reload.maintenance).to eq "編集：グースネック交換"
        expect(micropost.reload.time).to eq 10
        expect(micropost.reload.picture.url).to include "test_micropost2.jpg"
      end

      it "無効な更新" do
        fill_in "タイトル", with: ""
        click_button "更新する"
        expect(page).to have_content 'Nameを入力してください'
      end
    end

    context "投稿の削除処理", js: true do
      it "削除成功のフラッシュが表示されること" do
        login_for_system(user)
        visit micropost_path(micropost)
        click_link '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '投稿が削除されました'
      end
    end

    context "コメントの登録＆削除" do
      it "自分の投稿に対するコメントの登録＆削除が正常に完了すること" do
        login_for_system(user)
        visit micropost_path(micropost)
        fill_in "comment_content", with: "コントロールロープを動かす回数を増やしてみよう"
        click_button "コメント"
        within find("#comment-#{Comment.last.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: 'コントロールロープを動かす回数を増やしてみよう'
        end
        expect(page).to have_content "コメントを追加しました！"
        click_link "削除", href: comment_path(Comment.last)
        expect(page).not_to have_selector 'span', text: 'コントロールロープを動かす回数を増やしてみよう'
        expect(page).to have_content "コメントを削除しました"
      end

      it "別ユーザーの投稿のコメントには削除リンクが無いこと" do
        login_for_system(other_user)
        visit micropost_path(micropost)
        within find("#comment-#{comment.id}") do
          expect(page).to have_selector 'span', text: user.name
          expect(page).to have_selector 'span', text: comment.content
          expect(page).not_to have_link '削除', href: micropost_path(micropost)
        end
      end
    end
  end
end

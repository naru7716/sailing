require "rails_helper"

RSpec.describe "投稿作成", type: :request do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:micropost) { create(:micropost, user: user) }
  let(:picture_path) { File.join(Rails.root, 'spec/fixtures/test_micropost.jpg') }
  let(:picture) { Rack::Test::UploadedFile.new(picture_path) }
  
  context "ログインしているユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get new_micropost_path
      expect(response).to have_http_status "200"
      expect(response).to render_template('microposts/new')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get new_micropost_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end

  context "ログインしているユーザーの場合" do
    before do
      login_for_request(user)
      get new_micropost_path
    end

    it "レスポンスが正常に表示されること" do
      expect(response).to have_http_status "200"
      expect(response).to render_template('microposts/new')
    end

    it "有効な投稿データで登録できること" do
      expect {
        post microposts_path, params: { micropost: { name: "大会１ヶ月前",
                                            description: "レース艇のセッティングの見直しを海上で行った。",
                                            team: "あああ大学",
                                            wind: "南南東",
                                            maintenance: "グースネック交換",
                                            time: 5,
                                            picture: picture,
                                            settings_attributes: [
                                              name: "ギア",
                                              value: "0"
                                            ] } }
      }.to change(Micropost, :count).by(1)
      follow_redirect!
      expect(response).to render_template('microposts/show')
    end

    it "セッティングのデータも同時に増えること" do
      expect {
        post microposts_path, params: { micropost: { name: "大会１ヶ月前",
                                            settings_attributes: [
                                              name: "ギア",
                                              value: "0"] } }
      }.to change(Setting, :count).by(1)
    end

    it "無効な投稿データでは登録できないこと" do
      expect {
        post microposts_path, params: { micropost: { name: "",
                                            description: "レース艇のセッティングの見直しを海上で行った。",
                                            team: "あああ大学",
                                            wind: "南南東",
                                            maintenance: "グースネック交換",
                                            time: 5,
                                            picture: picture } }
      }.not_to change(Micropost, :count)
      expect(response).to render_template('microposts/new')
    end
  end

  context "セッティング無しの投稿登録" do
    it "正常に完了すること" do
      expect {
        post microposts_path, params: { micropost: { name: "大会１ヶ月前" } }
      }.to change(Micropost, :count).by(0)
   end

    it "セッティングのデータは増えないこと" do
      expect {
        post microposts_path, params: { microposts: { name: "大会１ヶ月前" } }
      }.not_to change(Setting, :count)
    end
  end
end
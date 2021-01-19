require "rails_helper"

RSpec.describe "投稿編集", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:micropost) { create(:micropost, user: user) }
  let(:picture2_path) { File.join(Rails.root, 'spec/fixtures/test_micropost2.jpg') }  # 追記
  let(:picture2) { Rack::Test::UploadedFile.new(picture2_path) }

  context "認可されたユーザーの場合" do
    it "レスポンスが正常に表示されること" do
      login_for_request(user)
      get edit_micropost_path(micropost)
      expect(response).to render_template('microposts/edit')
      patch micropost_path(micropost), params: { micropost: { name: "大会１ヶ月前",
                                                      description: "レース艇のセッティングの見直しを海上で行った。",
                                                      team: "あああ大学",
                                                      wind: "南南東",
                                                      maintenance: "グースネック交換",
                                                      time: 5,
                                                      picture: picture2 } }
      redirect_to micropost
      follow_redirect!
      expect(response).to render_template('microposts/show')
    end
  end

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get edit_micropost_path(micropost)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
      patch micropost_path(micropost), params: { micropost: { name: "大会１ヶ月前",
                                                      description: "レース艇のセッティングの見直しを海上で行った。",
                                                      team: "あああ大学",
                                                      wind: "南南東",
                                                      maintenance: "グースネック交換",
                                                      time: 5} }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to login_path
    end
  end

  context "別アカウントのユーザーの場合" do
    it "ホーム画面にリダイレクトすること" do
      login_for_request(other_user)
      get edit_micropost_path(micropost)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
      patch micropost_path(micropost), params: { micropost: { name: "大会１ヶ月前",
                                                      description: "レース艇のセッティングの見直しを海上で行った。",
                                                      team: "あああ大学",
                                                      wind: "南南東",
                                                      maintenance: "グースネック交換",
                                                      time: 5} }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to root_path
    end
  end
end
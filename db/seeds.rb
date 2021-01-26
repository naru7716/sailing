User.create!(
  [
    {
      name:  "山田 良子",
      email: "yamada@example.com",
      password:              "foobar",
      password_confirmation: "foobar",
      admin: true,
    },
    {
      name:  "鈴木 恵子",
      email: "suzuki@example.com",
      password:              "password",
      password_confirmation: "password",
    },
    {
      name:  "採用 太郎",
      email: "recruit@example.com",
      password:              "password",
      password_confirmation: "password",
    },
  ]
)

user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)
user3.follow(user1)
user3.follow(user2)

# 投稿
description1 = "スタート練習（stop&go）,ラインまでの距離の確認、加速練習"
description2 = "セーリング、風に合わせたセールトリム、スピード合わせ"
description3 = "回転練習、タック練習、ジャイブ練習、8の字"
team1 = "AAA大学"
team2 = "BBB大学"
team3 = "CCC大学"
wind1 = "風速3m南南西"
wind2 = "風速6m北北東"
wind3 = "風速10m南"
maintenance1 = "グースネック交換、セールをnewに変更"
maintenance2 = "プリべンを650mmに変更"
maintenance3 = "ジブシートが切れたので新調"

## 3ユーザー、それぞれ5投稿ずつ作成
Micropost.create!(
  [
    {
      name: "大会１ヶ月前",
      user_id: 1,
      description: description1,
      team: team1,
      time: 5,
      wind: wind1,
      maintenance: maintenance1,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会1ヶ月前",
      user_id: 2,
      description: description1,
      team: team2,
      time: 5,
      wind: wind1,
      maintenance: maintenance1,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会1ヶ月前",
      user_id: 3,
      description: description1,
      team: team3,
      time: 5,
      wind: wind1,
      maintenance: maintenance1,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会2ヶ月前",
      user_id: 1,
      description: description2,
      team: team1,
      time: 5,
      wind: wind2,
      maintenance: maintenance2,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会2ヶ月前",
      user_id: 2,
      description: description2,
      team: team2,
      time: 5,
      wind: wind2,
      maintenance: maintenance2,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会2ヶ月前",
      user_id: 3,
      description: description2,
      team: team3,
      time: 5,
      wind: wind2,
      maintenance: maintenance2,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会3ヶ月前",
      user_id: 1,
      description: description3,
      team: team1,
      time: 5,
      wind: wind3,
      maintenance: maintenance3,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会3ヶ月前",
      user_id: 2,
      description: description3,
      team: team2,
      time: 5,
      wind: wind3,
      maintenance: maintenance3,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会3ヶ月前",
      user_id: 3,
      description: description3,
      team: team3,
      time: 5,
      wind: wind3,
      maintenance: maintenance3,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会4ヶ月前",
      user_id: 1,
      description: description1,
      team: team1,
      time: 5,
      wind: wind1,
      maintenance: maintenance1,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会4ヶ月前",
      user_id: 2,
      description: description1,
      team: team2,
      time: 5,
      wind: wind1,
      maintenance: maintenance1,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
      },
    {
      name: "大会4ヶ月前",
      user_id: 3,
      description: description1,
      team: team3,
      time: 5,
      wind: wind1,
      maintenance: maintenance1,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
      },
    {
      name: "大会5ヶ月前",
      user_id: 1,
      description: description2,
      team: team1,
      time: 5,
      wind: wind2,
      maintenance: maintenance2,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会5ヶ月前",
      user_id: 2,
      description: description2,
      team: team2,
      time: 5,
      wind: wind2,
      maintenance: maintenance2,
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
    {
      name: "大会5ヶ月前",
      user_id: 3,
      description: description2,
      team: team2,
      time: 5,
      wind: wind2,
      maintenance: maintenance2,
      picture: open("#{Rails.root}/public/images/5.jpg"),
      settings_attributes: [
                                { name: "ギア", value: "0" },
                                { name: "マストレーキ", value: "6750mm" },
                                { name: "プリべンド", value: "1本" },
                                { name: "サイドテンション", value: "35" },
                                { name: "フォアテンション", value: "25" },
                                { name: "アウトホール", value: "バンドから1.5cm" },
                                { name: "ジブタック", value: "横シワを入れる" },
                                { name: "", value: "" },
                                { name: "", value: "" },
                                { name: "", value: "" }
                              ],
    },
  ]
)

micropost3 = Micropost.find(3)
micropost6 = Micropost.find(6)
micropost12 = Micropost.find(12)
micropost13 = Micropost.find(13)
micropost14 = Micropost.find(14)
micropost15 = Micropost.find(15)

# お気に入り登録
user3.favorite(micropost13)
user3.favorite(micropost14)
user1.favorite(micropost15)
user2.favorite(micropost12)

# コメント
micropost15.comments.create(user_id: user1.id, content: "コントロールロープを風に合わせて沢山動かしましょう！")
micropost12.comments.create(user_id: user2.id, content: "他艇と距離を保ちましょう！")

# 通知
user3.notifications.create(user_id: user3.id, micropost_id: micropost15.id,
                           from_user_id: user1.id, variety: 1)
user3.notifications.create(user_id: user3.id, micropost_id: micropost15.id,
                           from_user_id: user1.id, variety: 2)
user3.notifications.create(user_id: user3.id, micropost_id: micropost12.id,
                           from_user_id: user2.id, variety: 1)
user3.notifications.create(user_id: user3.id, micropost_id: micropost12.id,
                           from_user_id: user2.id, variety: 2)

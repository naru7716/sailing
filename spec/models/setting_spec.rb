require 'rails_helper'

RSpec.describe Setting, type: :model do
  let(:setting) { create(:setting) }

  it "有効な状態であること" do
    expect(setting).to be_valid
  end
end
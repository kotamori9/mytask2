require 'rails_helper'
describe User do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
    end

    it "password（２回目）がない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
    end

  end
end
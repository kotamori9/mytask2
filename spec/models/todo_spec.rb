require 'rails_helper'
describe Todo do
  describe '#create' do

    it "todoがない場合登録できないこと" do
      todo = build(:todo, todo: "")
      todo.valid?
    end

    it "enddateがない場合登録できないこと" do
      todo = build(:todo, enddate: "")
      todo.valid?
    end

  end
end
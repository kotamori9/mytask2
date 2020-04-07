require 'rails_helper'
describe Todo do
  describe '#create' do

    it "todoがない場合登録できないこと" do
      user = build(:todo, todo: "")
      todo.valid?
    end

  end
end
require 'rails_helper'
describe Task do
  describe '#create' do

    it "taskがない場合登録できないこと" do
      task = build(:task, content: "")
      task.valid?
    end

  end
end
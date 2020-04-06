require 'rails_helper'

describe TasksController do
  # newアクションに関するテスト
  describe 'GET #new' do
    it "renders the :new template" do
    end
  end

  # createアクションに関するテスト
  describe 'Post #create' do
    let(:params) {user_id: user.id}
    context '保存に成功した場合' do
      subject {
        post :create,
        params: params
      }
      it 'Taskを保存すること' do
        expect{ subject }.to change(Task, :count).by(1)
      end
    end
  end

end
require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスク登録' do
    context 'タスク登録がうまくいくとき' do
      it '文字が入力されていれば登録できる' do
        expect(@task).to be_valid
      end

      it 'point_idが空でも登録できる' do
        @task.point_id = nil
        expect(@task).to be_valid
      end
    end

    context 'タスク登録がうまくいかないとき' do
      it '文字が入力されていないと登録できない' do
        @task.content = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Content can't be blank")
      end

      it 'タスクが11文字以上だと登録できない' do
        @task.content = 'あああああああああああ'
        @task.valid?
        expect(@task.errors.full_messages).to include('Content is too long (maximum is 10 characters)')
      end
    end
  end
end

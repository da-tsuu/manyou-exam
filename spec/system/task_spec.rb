require 'rails_helper'
# require File.expand_path("../../config/environment", __FILE__)
RSpec.describe 'タスク管理機能', type: :system do
    FactoryBot.create(:task)
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること'
      'GET tasks#index'
      # save_and_open_page
      expect(page).to have_content ‘task’
        end
    end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること'
    end
  end

  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' 
     end
  end
end
require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :model do
  scenario 'titleが空ならバリデーションが通らない' do
    task = Task.new(user_id: "1", title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  scenario 'contentが空ならバリデーションが通らない' do
    task = Task.new(user_id: "1", title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  scenario 'titleとcontentに内容が記載されていればバリデーションが通る' do
    task = Task.new(user_id: "1", title: '成功テスト', content: '成功')
    expect(task).to be_valid
  end

  context 'ステータス検索' do
    scenario '検索ワード：完了 → 1件'do
      FactoryBot.create(:user)
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      expect(Task.search_status( "2" ).count).to eq 1
    end
  end

  context 'タイトル検索' do
    scenario '検索ワード 卍 ： → 1件'do
      FactoryBot.create(:user)
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      expect(Task.search_title( "卍" ).count).to eq 1
    end
  end

  context 'タイトルとステータス検索' do
    scenario '検索ワード : 未着手　:☆ →　1件' do
      FactoryBot.create(:user)
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      expect(Task.search_status("0").search_title("☆").count).to eq 1
    end
  end

end
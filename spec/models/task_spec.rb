require 'rails_helper'

RSpec.feature 'タスク管理機能', type: :model do
  scenario 'titleが空ならバリデーションが通らない' do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  scenario 'contentが空ならバリデーションが通らない' do
    task = Task.new(title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  scenario 'titleとcontentに内容が記載されていればバリデーションが通る' do
    task = Task.new(title: '成功テスト', content: '成功')
    expect(task).to be_valid
  end
end
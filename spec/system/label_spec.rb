require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
    FactoryBot.create(:user3)
    FactoryBot.create(:label01)
    FactoryBot.create(:label02)
    FactoryBot.create(:label03)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
    FactoryBot.create(:search_task_03)
    FactoryBot.create(:task_label01)
    FactoryBot.create(:task_label02)
    FactoryBot.create(:task_label03)

    visit new_session_path
    fill_in 'Email', with: 'test1@a.com'
    fill_in 'Password', with: 'hogehoge'
    click_on 'Log in'
  end

  describe 'タスク一覧・詳細画面' do
    context 'ラベル付タスクを作成した場合' do
      it 'タスク一覧にラベルが表示されること' do
        visit tasks_path
        expect(page).to have_content '会議'
        expect(page).to have_content 'リカバリー'
      end

      it 'タスク詳細にラベルが表示されること' do
        visit task_path(1)
        expect(page).to have_content '会議'
      end
    end
  end

end
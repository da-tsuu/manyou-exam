require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:user1)
    FactoryBot.create(:user2)
    FactoryBot.create(:user3)
    FactoryBot.create(:label01)
    FactoryBot.create(:label02)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:search_task_03)
    FactoryBot.create(:task_label01)
    FactoryBot.create(:task_label02)

    visit new_session_path
    fill_in 'Email', with: 'test1@a.com'
    fill_in 'Password', with: 'hogehoge'
    click_on 'Log in'
  end

  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do
        visit tasks_path
        expect(page).to have_content 'test_task'
        expect(page).to have_content '高'
        expect(page).to have_content '未着手'
        expect(page).to have_content '2019-11-17'
      end
    end

    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順にならんでいること' do
        visit tasks_path
        task_list = page.all('td')
        expect(task_list[1]).to have_content 'test_content2'
      end
    end

    context '複数ユーザーがタスクを作成した場合' do
      it '自分のタスクのみ表示されること' do
        visit tasks_path
        task_list = page.all('td')
        expect(task_list[0]).to have_content 'test_task2'

      end
    end
  end

  describe 'ソート・検索機能' do
    context '検索・ソート機能' do
      it 'タスクが終了期限の降順にソートできること' do
        visit tasks_path
        click_link '終了期限でソートする'
        sleep 2
        task_list = page.all('td')
        expect(task_list[0]).to have_content 'test_task'
      end

      it 'タスクが終了期限の降順にソートできること' do
        visit tasks_path
        click_link '優先順位でソートする'
        sleep 2
        task_list = page.all('td')
        expect(task_list[1]).to have_content 'test_content'
      end
    end
  end

  describe 'タスク登録画面' do
    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do
        visit new_task_path
        fill_in 'タスク名', with: '成約マッチ'
        select "高"
        fill_in 'タスク詳細', with: 'test_details'
        find("option[value='未着手']").select_option
        select "未着手"
        click_on '登録する'
        expect(page).to have_content '成約マッチ'
      end
    end
  end

  describe 'タスク詳細画面' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示されたページに遷移すること' do
        task = FactoryBot.create(:task, 
                            id: 999,
                            title: '新規既存判定',
                            priority: '中',
                            content: '新規既存データの判定',
                            status: '未着手',
                            expiration: 'Sun, 17 Nov 2020')
        visit task_path(999)
        expect(page).to have_content '新規既存判定'
        expect(page).to have_content '新規既存データの判定'
        expect(page).to have_content '2020-11-17'
      end
    end
  end

  describe 'タスク一覧' do
    context 'ラベル検索した場合' do
      it '検索結果が表示されること' do
      expect(Task.search_status("0").search_title("test_task").search_label("1").count).to eq 1
      end
    end
  end

end


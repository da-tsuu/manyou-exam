require "rails_helper"
RSpec.feature "タスク管理機能", type: :feature do
  feature "タスクを作成した場合" do
    scenario "作成済みのタスクが表示されること" do
      FactoryBot.create(:user)
      visit new_session_path
      fill_in 'Email', with: 'user@aaa.aaa'
      fill_in 'Password', with: 'MyString'
      click_on 'Log in'
      FactoryBot.create(:task)
      visit tasks_path
      
      expect(page).to have_content '卍'
    end
  end

  feature "タスク登録画面" do
    context '必要項目を入力して、createボタンを押した場合' do
      scenario "データが保存されること" do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in 'Email', with: 'user@aaa.aaa'
        fill_in 'Password', with: 'MyString'
        click_on 'Log in'
        visit new_task_path
        fill_in 'タスク名', with: '卍'
        fill_in 'タスク詳細', with: '卍～'

        click_on '登録する'
        expect(page).to have_content "卍","卍～"
  
      end
    end
  end



  scenario "タスク詳細" do
    FactoryBot.create(:user)
    visit new_session_path
    fill_in 'Email', with: 'user@aaa.aaa'
    fill_in 'Password', with: 'MyString'
    click_on 'Log in'
    @task = FactoryBot.create(:task)
    visit task_path(@task.id)

    expect(page).to have_content "卍","卍～"
  end

  context '複数のタスクを作成した場合' do
    scenario 'タスクが作成日時の降順に並んでいること' do
      FactoryBot.create(:user)
      visit new_session_path
      fill_in 'Email', with: 'user@aaa.aaa'
      fill_in 'Password', with: 'MyString'
      click_on 'Log in'
      FactoryBot.create(:task)
      FactoryBot.create(:second_task)
      FactoryBot.create(:third_task)
      visit tasks_path
      task_list = all('#task_row')
      expect(task_list[0]).to have_content '★'
      expect(task_list[1]).to have_content '☆' 
      expect(task_list[2]).to have_content '卍' 
  
    end
  end 

  feature 'タスク一覧画面' do
    context '終了期限でソートするボタンを押した場合' do
      scenario 'タスクが終了期限順で並んでいること' do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in 'Email', with: 'user@aaa.aaa'
        fill_in 'Password', with: 'MyString'
        click_on 'Log in'
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        FactoryBot.create(:third_task)
        visit tasks_path
        click_on '終了期限でソートする'
        task_list = all('#task_row')
        expect(task_list[0]).to have_content '★'
        expect(task_list[1]).to have_content '卍' 
        expect(task_list[2]).to have_content '☆' 
      end
    end
  end

  feature 'タスク一覧画面' do
    context '優先順位でソートするボタンを押した場合' do
      scenario 'タスクが優先順位順で並んでいること' do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in 'Email', with: 'user@aaa.aaa'
        fill_in 'Password', with: 'MyString'
        click_on 'Log in'
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        FactoryBot.create(:third_task)
        visit tasks_path
        click_on '優先順位でソートする'
        task_list = all('#task_row')
        expect(task_list[0]).to have_content '☆'
        expect(task_list[1]).to have_content '卍' 
        expect(task_list[2]).to have_content '★' 
      end
    end
  end
end
require "rails_helper"
RSpec.feature "タスク管理機能", type: :feature do
  background :skip => true do
    @task = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:second_task)
    @task3 = FactoryBot.create(:third_task)
    
  end

  feature "タスクを作成した場合" do
    scenario "作成済みのタスクが表示されること" do
      task = FactoryBot.create(:task, title: '5')
      visit tasks_path

      expect(page).to have_content "5"
    end
  end

  feature "タスク登録画面" do
    context '必要項目を入力して、createボタンを押した場合' do
      scenario "データが保存されること" do
        visit new_task_path
        fill_in 'タスク名', with: '1'
        fill_in 'タスク詳細', with: '1～'

        click_on '登録する'
        expect(page).to have_content "1","1～"
  
      end
    end
  end



  scenario "タスク詳細" do
    @task = FactoryBot.create(:task)
    visit task_path(@task)

    expect(page).to have_content "1","1～"
  end

  context '複数のタスクを作成した場合' do
    scenario 'タスクが作成日時の降順に並んでいること' do
      visit tasks_path
      # task_list = all('#task_row')
      # expect(task_list[0]).to have_content '3'
      # expect(task_list[1]).to have_content '2' 
      # expect(task_list[2]).to have_content '1' 
      tds = page.all('tbody td')
      expect(tds[0]).to have_content '1'
      # all('tbody td')[0].to have_content '1' 
    end
  end  
end
require "rails_helper"
RSpec.feature "タスク管理機能", type: :feature do
  background :skip => true do
    FactoryBot.create(:task)
  end

  feature "タスクを作成した場合" do
    scenario "作成済みのタスクが表示されること" do
      task = FactoryBot.create(:task, title: 'アル中')
      visit tasks_path

      expect(page).to have_content "アル中"
    end
  end

  feature "タスク登録画面" do
    context '必要項目を入力して、createボタンを押した場合' do
      scenario "データが保存されること" do
        visit new_task_path
        fill_in 'Title', with: 'アル中'
        fill_in 'Content', with: 'カラカラ～'

        click_on 'Create Task'
        expect(page).to have_content "アル中","カラカラ～"
  
      end
    end
  end



  scenario "タスク詳細" do
    @task = FactoryBot.create(:task)
    visit task_path(@task)

    expect(page).to have_content "アル中","カラカラ～"
  end

end
require "rails_helper"
RSpec.feature "Users", type: :feature do
  background :skip => true do
  FactoryBot.create(:user)
  FactoryBot.create(:admin_user)
  end

  feature "ユーザーを作成した場合" do
    context '必要項目を入力して、createボタンを押した場合' do
      scenario "アカウントが保存され、show画面に遷移すること" do
        visit new_user_path
        fill_in '名前', with: 'AAAAA'
        fill_in 'メールアドレス', with: 'aaaaa@aaa.aaa'
        fill_in 'パスワード', with: 'aaaaaa'
        click_on 'Create my account'

        expect(page).to have_content "UserProfile"
      end
    end
  end

  feature "アカウントを作成後ログイン画面に遷移し" do
    context '必要項目を入力して、Log in画面を押した場合' do
      scenario "ログインし、インデックス画面に遷移すること" do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in 'Email', with: 'user@aaa.aaa'
        fill_in 'Password', with: 'MyString'
        click_on 'Log in'

        expect(page).to have_content "Tasks Index"     
      end
    end
  end

  feature "adminがadminではないユーザーを作成した場合" do 
    scenario "adminがfalseのユーザーが作成されること" do
      @user = FactoryBot.create(:AdminUser)
      visit new_session_path
      fill_in 'Email', with: 'admin@aaa.aaa'
      fill_in 'Password', with: 'Admin1'
      click_on 'Log in'
      visit new_admin_user_path
      fill_in 'Name', with: 'sample'
      fill_in 'Email', with: 'sample@aaa.aaa'
      fill_in 'Password', with: 'sample'
      click_on 'Go!'
      all(:id, 'detail')[0].click_on
      expect(page).to have_content "Admin: false" 

    end
  end

  feature "adminがadminユーザーを作成した場合" do 
    scenario "adminがtrueのユーザーが作成されること" do
      @user = FactoryBot.create(:AdminUser)
      visit new_session_path
      fill_in 'Email', with: 'admin@aaa.aaa'
      fill_in 'Password', with: 'Admin1'
      click_on 'Log in'
      visit new_admin_user_path
      fill_in 'Name', with: 'sample'
      fill_in 'Email', with: 'sample@aaa.aaa'
      fill_in 'Password', with: 'sample'
      check "Admin Right"
      click_on 'Go!'
      all(:id, 'detail')[0].click_on
      expect(page).to have_content "Admin: true" 

    end
  end

  feature "adminではないユーザーがログインして" do
    context 'admin画面に移動しようとした場合' do
      scenario "admin画面には飛ばずタスク一覧画面に遷移すること" do
        FactoryBot.create(:user)
        visit new_session_path
        fill_in 'Email', with: 'user@aaa.aaa'
        fill_in 'Password', with: 'MyString'
        click_on 'Log in'
        visit admin_users_path
        expect(page).to have_content "Tasks Index"     
      end
    end
  end
end


    
    
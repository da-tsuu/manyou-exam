require 'rails_helper'

require 'selenium-webdriver'
require 'webdrivers'

 Selenium::WebDriver::Chrome.path = ENV.fetch('GOOGLE_CHROME_BIN', nil)

options = Selenium::WebDriver::Chrome::Options.new(
  prefs: { 'profile.default_content_setting_values.notifications': 2 },
  binary: ENV.fetch('GOOGLE_CHROME_SHIM', nil)
)

driver = Selenium::WebDriver.for :chrome, options: options 

RSpec.describe Task,'タスク管理機能', type: :system do
  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
    before do
      FactoryBot.create(:task)
    end
      it '作成済みのタスクが表示されること' do
      visit tasks_path
      expect(page).to have_no_content "アル中"
      end
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
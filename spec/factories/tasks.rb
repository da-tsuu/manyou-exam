FactoryBot.define do
  factory :task, class: Task do
    title { 'test_task' }
    content { 'test_content' }
    priority { 0 }
    status { '未着手' }
    expiration { 'Sun, 17 Nov 2019' }
    user_id { 10 }
  end

  factory :second_task, class: Task do
    title { 'test_task2' }
    content { 'test_content2' }
    priority { 1 }
    status { '着手中' }
    expiration { 'Sun, 30 Nov 2025' }
    user_id { 10 }
  end

  factory :third_task, class: Task do
    title { 'test_task2' }
    content { 'test_content2' }
    priority { 1 }
    status { '着手中' }
    expiration { 'Sun, 30 Nov 2025' }
    user_id { 20 }
  end

  factory :search_task_01, class: Task do
    title { '検索テスト' }
    content { '検索テスト' }
    priority { 2 }
    status { '未着手' }
    expiration { 'Sun, 30 Nov 2020' }
    user_id { 20 }
  end

  factory :search_task_02, class: Task do
    title { 'テスト検索' }
    content { 'テスト検索' }
    priority { 0 }
    status { '未着手' }
    expiration { 'Sun, 30 Nov 2021' }
    user_id { 20 }
  end

  factory :search_task_03, class: Task do
    title { 'テストけんさく' }
    content { 'テストけんさく' }
    priority { 2 }
    status { '完了' }
    expiration { 'Sun, 30 Nov 2022' }
    user_id { 30 }
  end
end
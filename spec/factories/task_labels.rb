FactoryBot.define do
  factory :task_label01, class: TaskLabel do
    label_id { 1 }
    task_id { 1 }
  end

  factory :task_label02, class: TaskLabel do
    label_id { 2 }
    task_id { 2 }
  end

  factory :task_label03, class: TaskLabel do
    label_id { 3 }
    task_id { 3 }
  end
end
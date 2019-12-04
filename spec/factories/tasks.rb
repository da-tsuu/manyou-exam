FactoryBot.define do
  factory :task do
    title { '1' }
    content { '1～' }    
    created_at {"2019-12-04 04:32:13"}
  end

  factory :second_task, class: Task do
    title { '2 '}
    content { '2～' }
    created_at {"2019-12-04 04:32:32"}
  end

  factory :third_task, class: Task do
    title { '3' }
    content { '3～ ' }
    created_at {"2019-12-04 05:08:43"}

  end



end

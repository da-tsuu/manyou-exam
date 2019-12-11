FactoryBot.define do
  factory :task do
    title { '1' }
    content { '1～' }    
    created_at {"2019-12-04 04:32:13"}
    expiration {"2019-12-20"}
    status {"完了"}
    priority {"中"}
  end

  factory :second_task, class: Task do
    title { '2 '}
    content { '2～' }
    created_at {"2019-12-04 04:32:32"}
    expiration {"2020-01-25"}
    status {"未着手"}
    priority {"高"}
  end

  factory :third_task, class: Task do
    title { '3' }
    content { '3～ ' }
    created_at {"2019-12-04 05:08:43"}
    expiration {"2019-12-10"}
    status {"着手中"}
    priority {"低"}

  end


end

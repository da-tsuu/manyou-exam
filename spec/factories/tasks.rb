FactoryBot.define do
  factory :task do
    title { '卍' }
    content { '卍～' }    
    created_at {"2019-12-04 04:32:13"}
    expiration {"2019-12-20"}
    status {"完了"}
    priority {"中"}
    user_id {User.last.id}
  end

  factory :second_task, class: Task do
    title { '☆'}
    content { '☆～' }
    created_at {"2019-12-04 04:32:32"}
    expiration {"2020-01-25"}
    status {"未着手"}
    priority {"高"}
    user_id {User.last.id}
  end

  factory :third_task, class: Task do
    title { '★' }
    content { '★～ ' }
    created_at {"2019-12-04 05:08:43"}
    expiration {"2019-12-10"}
    status {"着手中"}
    priority {"低"}
    user_id {User.last.id}
  end


end

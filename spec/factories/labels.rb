FactoryBot.define do
  factory :label01, class: Label do
    id { 1 }
    title { '会議' }
  end

  factory :label02, class: Label do
    id { 2 }
    title { 'リカバリー' }
  end

  factory :label03, class: Label do
    id { 3 }
    title { '修正' }
  end
end
FactoryGirl.define do
  factory :theater do
    sequence :name do |n|
      "Theater #{n}"
    end
    description "Best Theater. Eva!"
    website "http://www.dreamtheater.net"
    sequence :email do |n|
      "theater#{n}@example.com"
    end
  end

  factory :invalid_theater, parent: :theater do
    name nil
  end
end

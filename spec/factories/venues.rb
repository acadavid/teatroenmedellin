FactoryGirl.define do
  factory :venue do
    name "My cute theater"
    city "Medellin"
    address "CLL 10 21-12"
    phone "4444444"
    theater
  end

  factory :invalid_venue, parent: :venue do
    name nil
  end
end

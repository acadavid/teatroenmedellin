FactoryGirl.define do
  factory :act do
    name "Dog Cat Performance!"
    description "A cute dog cat"
    clasification "Kidos"
    price "9.99"
    theater
    venue
  end

  factory :invalid_act, parent: :act do
    name nil
  end
end

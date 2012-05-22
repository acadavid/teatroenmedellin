FactoryGirl.define do
  factory :act do
    name "Dog Cat Performance!"
    description "A cute dog cat"
    clasification "Kidos"
    price "9.99"
    FactoryGirl.create_list(:act_date, 3)
  end
end

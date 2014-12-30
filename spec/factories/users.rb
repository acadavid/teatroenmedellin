FactoryGirl.define do
  salt = "asdasdastr4325234324sdfds"  
  factory :user do
    sequence(:id)         { |n| "testuser#{n}" }
    email                 { "#{id}@example.com" }
    password              "secret"
    salt                  salt
    crypted_password      Sorcery::CryptoProviders::BCrypt.encrypt("secret", salt)
  end  

  factory :invalid_user, parent: :user do
    password nil
  end

end
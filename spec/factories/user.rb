FactoryGirl.define do
  factory :user, aliases: [:teacher, :commenter] do
    email 'ex@mail.com'
    password 'bigsecret'
    password_confirmation { password }
  end
end

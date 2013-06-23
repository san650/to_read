FactoryGirl.define do
  factory :user do
    name "user"
    email "user@example.org"
    password "password for user"

    factory :john do
      name "john"
      email "john@example.com"
    end

    factory :user_with_bookmark do
      name "user_with_bookmark"
      email "user_with_bookmark@example.org"
      password "password for user"
      after :create do |user|
        FactoryGirl.create :resource
      end
    end
  end

  factory :resource do
    link "http://www.example.org/"
    description "Lorem ipsum dolor"
    created_at 1.year.ago

    factory :google do
      link "http://www.google.com/"
    end
  end

  factory :bookmark do
    resource
    user

    factory :bookmark_read do
      pending false
    end

    factory :bookmark_deleted do
      deleted true
    end
  end
end

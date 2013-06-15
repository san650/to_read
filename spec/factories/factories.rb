FactoryGirl.define do
  factory :user do
    name "john"
    email "john@example.org"
    password "password for john"
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
    user
    resource

    factory :bookmark_read do
      pending false
    end

    factory :bookmark_deleted do
      deleted true
    end
  end
end

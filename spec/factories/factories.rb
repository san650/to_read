FactoryGirl.define do
  factory :user do
    name "john"
  end

  factory :resource do
    link "http://www.example.org/"

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

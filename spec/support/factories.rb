FactoryGirl.define do
  factory :user do
    name "Andrew Carmer"
    email "email@example.com"
    password "password"
  end

  factory :link do
    title "A Charlie Brown Christmas"
    url "https://www.youtube.com/watch?v=GPG3zSgm_Qo"
  end

end

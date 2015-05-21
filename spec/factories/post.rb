FactoryGirl.define do
  factory :post do
    body_markdown "### I am huge"
    body_html "<h3>I am huge"
    user_id 1
    title "My power"
  end
end

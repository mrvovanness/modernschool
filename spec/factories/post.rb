FactoryGirl.define do
  factory :post do
    user
    body_markdown "### I am huge"
    body_html "<h3>I am huge"
    title "My power"
  end
end

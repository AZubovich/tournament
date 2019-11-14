FactoryBot.define do
  factory :bet do
    money { 1 }
    tournament { nil }
    player { nil }
  end
end

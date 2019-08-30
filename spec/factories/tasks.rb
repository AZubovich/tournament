# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  answer      :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :task do
    description { "MyString" }
    answer { "MyString" }
  end
end

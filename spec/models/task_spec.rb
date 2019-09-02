# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  answer      :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

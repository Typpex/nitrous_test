# == Schema Information
#
# Table name: employees
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  licence            :string(255)
#  sexual_orientation :string(255)
#  birthday           :date
#  address            :text
#  created_at         :datetime
#  updated_at         :datetime
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

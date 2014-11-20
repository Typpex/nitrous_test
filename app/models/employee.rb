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

class Employee < ActiveRecord::Base
  has_many :documents, inverse_of: :employee, dependent: :destroy
  has_one :photo, class_name: 'Image', dependent: :destroy
end

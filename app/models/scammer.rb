# == Schema Information
#
# Table name: scammers
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

class Scammer < ActiveRecord::Base
  has_many :documents, dependent: :destroy
  has_one :photo, class_name: 'Image', dependent: :destroy
end

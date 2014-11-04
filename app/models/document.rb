class Document < ActiveRecord::Base
  belongs_to :scammer
  has_attached_file :file
end

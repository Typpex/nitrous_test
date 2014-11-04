class Image < ActiveRecord::Base
  belongs_to :scammer
  has_attached_file :avatar, styles: { :medium => "500x500>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => /^image\/(png|gif|jpeg|jpg)/
end

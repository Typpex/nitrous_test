class Image < ActiveRecord::Base
  belongs_to :scammer
  has_attached_file :file, 
  storage: :filesystem,
  styles: { :medium => "500x500>", :thumb => "100x100>" },
  path: ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
  url: "system/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment_content_type :file, :content_type => /^image\/(png|gif|jpeg|jpg)/

  def to_json
    to_return = {}
    to_return["name"] = self.file.original_filename
    to_return["size"] = self.file.size
    to_return["thumbnailUrl"]= "http://localhost:3000/" + self.file.url(:thumb).gsub("//thumb","/thumb")
    to_return["url"]= "http://localhost:3000/" + self.file.url.gsub("//original","/original")
    to_return["deleteUrl"]= ""
    to_return["deleteType"]= "DELETE"
    to_return
  end
end

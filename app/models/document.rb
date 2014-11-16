class Document < ActiveRecord::Base
  belongs_to :scammer
  has_attached_file :file,
                    storage: :filesystem,
                    path: ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename",
                    url: ":host/system/:class/:attachment/:id_partition/:style/:filename"

  validates_attachment_content_type :file, :content_type => /^(application|image)\/(vnd*|pdf|png|gif|jpeg|jpg|x-*)/
end

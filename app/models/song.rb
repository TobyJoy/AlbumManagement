class Song < ApplicationRecord
  
  mount_uploader :song_attachment, AttachmentUploader
  has_one :music_album, dependent: :destroy
  
end

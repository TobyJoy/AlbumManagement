require 'elasticsearch/model'

class MusicAlbum < ApplicationRecord
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  mount_uploader :photo, AvatarUploader
  has_many :songs
  belongs_to :user
  
  validates :name, presence: true
  
  after_save :refresh_elasticsearch_index
  
  def refresh_elasticsearch_index
    self.__elasticsearch__.index_document refresh: true
  end
  
end

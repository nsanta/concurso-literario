class Course < ActiveRecord::Base
  attr_accessible :description, :ends_at, :references, :starts_at, :title, :asset

  mount_uploader :asset , AssetUploader
  has_many :presentations
  has_many :rate_types
end

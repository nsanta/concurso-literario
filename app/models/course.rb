class Course < ActiveRecord::Base
  attr_accessible :description, :ends_at, :references, :starts_at, :title, :asset, :rules

  mount_uploader :asset , AssetUploader
  belongs_to :user
  has_many :presentations
  has_many :rate_types

  scope :actives , where("starts_at < ? AND ends_at > ?", Time.now,Time.now)
  
  


end

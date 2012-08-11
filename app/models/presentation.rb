class Presentation < ActiveRecord::Base

  mount_uploader :asset , AssetUploader

  belongs_to :user
  belongs_to :course

  attr_accessible :references , :asset
end

class Rate < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation
  attr_accessible :value
end

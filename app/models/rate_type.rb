class RateType < ActiveRecord::Base
  belongs_to :course
  attr_accessible :title
end

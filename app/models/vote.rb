class Vote < ActiveRecord::Base
  attr_accessible :value

  belongs_to :user
  belongs_to :pic
end

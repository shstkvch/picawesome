class Vote < ActiveRecord::Base
  attr_accessible :value
  attr_accessible :value, :user, :user_id, :pic, :pic_id, as: :admin

  belongs_to :user
  belongs_to :pic
end

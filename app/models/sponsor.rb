class Sponsor < ActiveRecord::Base
  has_one :plan
  has_one :user
end

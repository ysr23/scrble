class Member < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :joindate, :name, :postcode
end

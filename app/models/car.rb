class Car < ActiveRecord::Base
  belongs_to :user

  enum driving_profile: [:urban, :highway, :country_road]
end

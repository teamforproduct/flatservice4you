class User < ActiveRecord::Base
  has_one :car, dependent: :destroy

  accepts_nested_attributes_for :car

  validates :email, presence: true
end

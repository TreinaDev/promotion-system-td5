class Coupon < ApplicationRecord
  belongs_to :promotion
  validates :code, uniqueness: true

  enum status: { active: 0, inactive: 5 }

end

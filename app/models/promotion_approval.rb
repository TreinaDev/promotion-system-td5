class PromotionApproval < ApplicationRecord
  belongs_to :promotion
  belongs_to :user

  validate :different_user

  private

  def different_user
    if promotion && promotion.user == user #curto circuito
      errors.add(:user, 'não pode ser o criador da promoção')
    end
  end
end

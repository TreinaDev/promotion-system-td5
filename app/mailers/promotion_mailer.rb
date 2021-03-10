class PromotionMailer < ApplicationMailer
  def notify_approval(promotion_id)
    @promotion = Promotion.find(promotion_id)
    mail(subject: "Promoção #{@promotion.name} Aprovada",
         to: @promotion.user.email)
  end
end

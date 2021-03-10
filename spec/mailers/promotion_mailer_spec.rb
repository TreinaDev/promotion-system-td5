require 'rails_helper'

describe PromotionMailer do
  describe '#notify_approval' do
    it 'should build an email correctly' do
      user = create(:user, email: 'joao@gmail.com')
      promotion = create(:promotion, name: 'Black Fraude', user: user)

      henrique = create(:user, email: 'henrique@gmail.com')
      PromotionApproval.create(promotion: promotion, user: henrique)

      mail = PromotionMailer.notify_approval(promotion.id)

      expect(mail.subject).to eq 'Promoção Black Fraude Aprovada'
      expect(mail.to).to eq ['joao@gmail.com']
      expect(mail.from).to eq ['contato@promocoes.com.br']
      expect(mail.body).to include 'Promoção Aprovada'
      expect(mail.body).to include 'Sua promoção Black Fraude foi '\ #string multi line
'aprovada por henrique@gmail.com'
    end
  end
  
end
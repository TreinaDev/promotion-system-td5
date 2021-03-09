require 'rails_helper'

describe PaymentMethod do
  context 'PORO' do
    it 'should initialize a new payment method' do
      pm = PaymentMethod.new(name: 'Cartão de Crédito', code: 'CCRED')

      expect(pm.name).to eq 'Cartão de Crédito'
      expect(pm.code).to eq 'CCRED'
    end
  end


  context 'fetch API data' do
    it 'should get all payment methods' do
      resp_json = File.read(Rails.root.join('spec/support/apis/get_payment_methods.json'))
      resp_double = double('faraday_response', status: 200, body: resp_json)

      allow(Faraday).to receive(:get).with('pagamentos.com.br/api/v1/payment_methods')
                                     .and_return(resp_double)

      payment_methods = PaymentMethod.all

      expect(payment_methods.length).to eq 2
      expect(payment_methods.first.name).to eq 'Cartão de Crédito'
      expect(payment_methods.first.code).to eq 'CARTAO'

      expect(payment_methods.last.name).to eq 'Boleto'
      expect(payment_methods.last.code).to eq 'BOLE'

    end

    it 'should return empty if not authorized' do
      resp_double = double('faraday_response', status: 403, body: '')

      allow(Faraday).to receive(:get).with('pagamentos.com.br/api/v1/payment_methods')
                                     .and_return(resp_double)
      

      payment_methods = PaymentMethod.all

      expect(payment_methods.length).to eq 0
    end
  end



end
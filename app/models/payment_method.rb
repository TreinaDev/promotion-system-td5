class PaymentMethod #PORO -> Plain Old Ruby Obect

  attr_reader :name, :code

  def initialize(name:, code:)
    @name = name
    @code = code
  end

  def self.all
    response = Faraday.get('pagamentos.com.br/api/v1/payment_methods')
    return [] if response.status == 403 # Guard Clause
    return [] if response.status == 501 # Guard Clause

    json_response = JSON.parse(response.body, symbolize_names: true)

    payment_methods = []
    json_response.each do |r|
      payment_methods << new(name: r[:name], code: r[:code])
    end
    return payment_methods
  end

end
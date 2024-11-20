# frozen_string_literal: true

CONVERSION_RATES = {
  'rubles' => 1,
  'dollars' => 100,
  'euros' => 110,
  'byn' => 30,
  'pnd' => 126
}.freeze

SYMBOL_TO_CURRENCY = {
  '$' => 'dollars',
  '€' => 'euros',
  '₽' => 'rubles',
  'BYN' => 'byn',
  '£' => 'pnd'
}.freeze

# class for convertation to rubles
class ConvertationToRubles
  class << self
    def parse_price(price_str)
      _, curr = SYMBOL_TO_CURRENCY.find do |symbol, _curr|
        price_str.include?(symbol)
      end
      [price_str.delete('^0-9').to_i, curr]
    end

    def convert_to_rubles(price_str)
      price, currency = parse_price(price_str)
      price * CONVERSION_RATES[currency]
    end
  end
end

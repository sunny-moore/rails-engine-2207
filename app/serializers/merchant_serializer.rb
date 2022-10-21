class MerchantSerializer

  def self.merchants(merchants)
    {
      "data": 
      merchants.map do |merchant|
        {
          "type": merchant.class.to_s.downcase,
          "id": merchant.id.to_s,
          "attributes": {
            "name": merchant.name
          }
        }
      end
    }
  end

  def self.merchant(merchant)
    {
      "data": [
        {
          "type": merchant.class.to_s.downcase,
          "id": merchant.id.to_s,
          "attributes": {
            "name": merchant.name
          }
        }
      ]
    }
  end
end
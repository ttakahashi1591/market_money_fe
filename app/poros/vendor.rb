class Vendor 
  attr_reader :vendor_id,
              :name,
              :description,
              :contact_name,
              :contact_phone,
              :credit_accepted
  
  def initialize(data)
    @vendor_id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @contact_name = data[:attributes][:contact_name]
    @contact_phone = data[:attributes][:contact_phone]
    @credit_accepted = data[:attributes][:credit_accepted]
  end
end
# frozen_string_literal: true

class User

  attr_accessor :country_id, :email, :zone_id, :address_one, :postcode,
                :first_name, :last_name, :telephone, :password, :company,
                :city, :subscribe, :address_too, :fax, :policy,
                :confirm_password

  def initialize
    @first_name = ''
    @last_name = ''
    @email = ''
    @telephone = ''
    @company = ''
    @address_one = ''
    @city = ''
    @postcode = ''
    @country_id = ''
    @zone_id = ''
    @password = ''
    @confirm_password = ''
    @company = ''
    @address_too = ''
    @subscribe = true
    @policy = true
    @fax = ''
  end
end


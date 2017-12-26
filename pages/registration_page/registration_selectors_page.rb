# frozen_string_literal: true

class RegistrationSelectorsPage

  FIRST_NAME = { name: 'firstname' }.freeze

  LAST_NAME = { name: 'lastname' }.freeze

  EMAIL = { name: 'email' }.freeze

  TELEPHONE = { name: 'telephone' }.freeze

  FAX = { name: 'fax' }.freeze

  COMPANY = { name: 'company' }.freeze

  ADDRESS_1 = { name: 'address_1' }.freeze

  ADDRESS_2 = { name: 'address_2' }.freeze

  CITY = { name: 'city' }.freeze

  POSTCODE = { name: 'postcode' }.freeze

  COUNTRY_ID = { name: 'country_id' }.freeze

  ZONE_ID = { name: 'zone_id' }.freeze

  PASSWORD = { name: 'password' }.freeze

  CONFIRM_PASSWORD = { name: 'confirm' }.freeze

  RADIO_YES = { css: "input[name='newsletter'][value='1']" }.freeze

  RADIO_NO = { css: "input[name='newsletter'][value='0']" }.freeze

  CHECKBOX_POLICY = { css: "input[name='agree'][value='1']" }.freeze

  BUTTON_CONTINUE = { css: '.btn.btn-primary' }.freeze

  INPUTS_ERROR_NOTIFICATION = { css: 'div.text-danger'} .freeze

  ALERT_NOTIFICATION = { css: 'div.alert.alert-danger' }.freeze
end

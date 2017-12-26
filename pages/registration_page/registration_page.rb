# frozen_string_literal: true

require 'pry'
require_relative '../../tools/search/search'
require_relative '../../pages/registration_page/registration_selectors_page'

class RegistrationPage < Search
  def initialize(driver)
    super(driver)
  end

  def registration_page_smoke?
    require_elements = [first_name, last_name, email, password,
                        password_confirm, checkbox_policy, button_continue]
    smoke?(require_elements)
  end

  def first_name
    web_driver.find_element(RegistrationSelectorsPage::FIRST_NAME)
  end

  def last_name
    web_driver.find_element(RegistrationSelectorsPage::LAST_NAME)
  end

  def email
    web_driver.find_element(RegistrationSelectorsPage::EMAIL)
  end

  def telephone
    web_driver.find_element(RegistrationSelectorsPage::TELEPHONE)
  end

  def fax
    web_driver.find_element(RegistrationSelectorsPage::FAX)
  end

  def company
    web_driver.find_element(RegistrationSelectorsPage::COMPANY)
  end

  def address_1
    web_driver.find_element(RegistrationSelectorsPage::ADDRESS_1)
  end

  def address_2
    web_driver.find_element(RegistrationSelectorsPage::ADDRESS_2)
  end

  def city
    web_driver.find_element(RegistrationSelectorsPage::CITY)
  end

  def postcode
    web_driver.find_element(RegistrationSelectorsPage::POSTCODE)
  end

  def country_id
    web_driver.find_element(RegistrationSelectorsPage::COUNTRY_ID)
  end

  def country_id_option(user_country_id)
    country_id.find_element(:css, "option[value='#{user_country_id}']")
  end

  def zone_id
    web_driver.find_element(RegistrationSelectorsPage::ZONE_ID)
  end

  def zone_id_option(user_zone_id)
    zone_id.find_element(:css, "option[value='#{user_zone_id}']")
  end

  def password
    web_driver.find_element(RegistrationSelectorsPage::PASSWORD)
  end

  def password_confirm
    web_driver.find_element(RegistrationSelectorsPage::CONFIRM_PASSWORD)
  end

  def subscribe_radio_yes
    web_driver.find_element(RegistrationSelectorsPage::RADIO_YES)
  end

  def subscribe_radio_no
    web_driver.find_element(RegistrationSelectorsPage::RADIO_NO)
  end

  def checkbox_policy
    web_driver.find_element(RegistrationSelectorsPage::CHECKBOX_POLICY)
  end

  def button_continue
    web_driver.find_element(RegistrationSelectorsPage::BUTTON_CONTINUE)
  end

  def inputs_text_error_notification
    web_driver.find_elements(RegistrationSelectorsPage::INPUTS_ERROR_NOTIFICATION)
  end

  def alert_notification
    web_driver.find_element(RegistrationSelectorsPage::ALERT_NOTIFICATION)
  end
end

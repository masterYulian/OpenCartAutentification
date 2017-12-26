# frozen_string_literal: true

require_relative 'registration_page'
require 'pry'

class RegistrationAtomicPage

  attr_reader :registration_page

  def initialize(driver)
    @registration_page = RegistrationPage.new(driver)
  end

  def first_name_clear_text
    @registration_page.first_name.clear
  end

  def first_name_send_text(text)
    first_name_clear_text
    @registration_page.first_name.send_keys(text)
  end

  def last_name_clear_text
    @registration_page.last_name.clear
  end

  def last_name_send_text(text)
    last_name_clear_text
    @registration_page.last_name.send_keys(text)
  end

  def email_clear_text
    @registration_page.email.clear
  end

  def email_send_text(text)
    email_clear_text
    @registration_page.email.send_keys(text)
  end

  def telephone_clear_text
    @registration_page.telephone.clear
  end

  def telephone_send_text(text)
    telephone_clear_text
    @registration_page.telephone.send_keys(text)
  end

  def fax_clear_text
    @registration_page.fax.clear
  end

  def fax_send_text(text)
    fax_clear_text
    @registration_page.fax.send_keys(text)
  end

  def company_clear_text
    @registration_page.company.clear
  end

  def company_send_text(text)
    company_clear_text
    @registration_page.company.send_keys(text)
  end

  def address_1_clear_text
    @registration_page.address_1.clear
  end

  def address_1_send_text(text)
    address_1_clear_text
    @registration_page.address_1.send_keys(text)
  end

  def address_2_clear_text
    @registration_page.address_2.clear
  end

  def address_2_send_text(text)
    address_2_clear_text
    @registration_page.address_2.send_keys(text)
  end

  def city_clear_text
    @registration_page.city.clear
  end

  def city_send_text(text)
    city_clear_text
    @registration_page.city.send_keys(text)
  end

  def postcode_clear_text
    @registration_page.postcode.clear
  end

  def postcode_send_text(text)
    postcode_clear_text
    @registration_page.postcode.send_keys(text)
  end

  def password_clear_text
    @registration_page.password.clear
  end

  def password_send_text(text)
    password_clear_text
    @registration_page.password.send_keys(text)
  end

  def password_confirm_clear_text
    @registration_page.password_confirm.clear
  end

  def password_confirm_send_text(text)
    password_confirm_clear_text
    @registration_page.password_confirm.send_keys(text)
  end

  def choose_country_id_option(user_country_id)
    @registration_page.country_id_option(user_country_id).click
  end

  def choose_zone_id_option(user_zone_id)
    @registration_page.zone_id_option(user_zone_id).click
  end

  def choose_subscribe_radio_yes_no(user_subscribe_value)
    if user_subscribe_value == 'true'
      @registration_page.subscribe_radio_yes.click
    else
      @registration_page.subscribe_radio_no.click
    end
  end

  def choose_checkbox_policy_value(user_policy_checked_value)
    if user_policy_checked_value == 'true'
      @registration_page.checkbox_policy.click unless @registration_page
                                                      .checkbox_policy.selected?
    else
      @registration_page.checkbox_policy.click if @registration_page.checkbox_policy.selected?
    end

  end

  def button_continue_click
    @registration_page.button_continue.click
  end

end
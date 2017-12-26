# frozen_string_literal: true

require 'pry'
require_relative 'registration_atomic_page'
require_relative '../../pages/success_register_page/success_register_logic_page'
require_relative '../../pages/success_register_page/success_register_atomic_page'
require_relative '../../data/users/user_repository'

class RegistrationBusinessPage
  attr_reader :registration_atomic_page

  def initialize(registration_atomic_page)
    @registration_atomic_page = registration_atomic_page
  end

  def smoke?
    @registration_atomic_page.registration_page.registration_page_smoke?
  end

  def register(user)
    Application.get.browser.open_url(ApplicationSourceRepository.default.user_register_url)
    apply_register_account_data(user)
    SuccessRegisterLogicPage.new(SuccessRegisterAtomicPage.new(@registration_atomic_page
                                                                   .registration_page.web_driver))
  end

  def apply_fields_data(user)
    apply_register_account_data(user)
    RegistrationBusinessPage.new(RegistrationAtomicPage
                                     .new(@registration_atomic_page
                                              .registration_page.web_driver))
  end

  def template_email_error_notification?(email)
    if (email =~ UserRepository.email_regex).zero?
      email_error_identify?
    else
      false
    end
  end

  def email_error_notification?
    email_error_identify?
  end

  def email_error_identify?
    error_notification = false
    error_notifications.each do |notification|
      if notification.text.include? 'E-Mail'
        error_notification = true
        break
      end
    end
    error_notification
  end

  def invalid_data_register(user)
    apply_register_account_data(user)
    unless error_notifications.empty?
      error_notifications.each do |item|
        @registration_atomic_page.registration_page
                                 .logger.info item.text
      end
    end
    RegistrationBusinessPage.new(RegistrationAtomicPage
                                     .new(@registration_atomic_page
                                              .registration_page.web_driver))
  end

  def default_fields_register
    @registration_atomic_page.registration_page.web_driver.navigate.refresh
    @registration_atomic_page.button_continue_click
    RegistrationBusinessPage.new(RegistrationAtomicPage
                                     .new(@registration_atomic_page
                                              .registration_page.web_driver))
  end

  def alert_notification_identify(user = nil)
    if user.nil?
      @registration_atomic_page.choose_checkbox_policy_value('false')
      @registration_atomic_page.button_continue_click
    else
      apply_register_account_data(user)
    end
    error_notifications
    RegistrationBusinessPage.new(RegistrationAtomicPage
                                     .new(@registration_atomic_page
                                              .registration_page.web_driver))
  end

  def alert_notification?
    if @registration_atomic_page.registration_page.alert_notification.nil?
      false
    else
      alert_danger_message = @registration_atomic_page.registration_page
                                                      .alert_notification.text
      @registration_atomic_page.registration_page
                               .logger.info alert_danger_message
      true
    end
  end

  def error_notifications
    error_notifications = @registration_atomic_page.registration_page
                                                   .inputs_text_error_notification
                                                   .reject do |item|
      item.text.to_s.empty?
    end
    error_notifications
  end

  def apply_register_account_data(user)
    @registration_atomic_page.first_name_send_text(user.first_name)
    @registration_atomic_page.last_name_send_text(user.last_name)
    @registration_atomic_page.email_send_text(user.email)
    @registration_atomic_page.telephone_send_text(user.email)
    @registration_atomic_page.telephone_send_text(user.telephone)
    @registration_atomic_page.fax_send_text(user.fax)
    @registration_atomic_page.company_send_text(user.company)
    @registration_atomic_page.address_1_send_text(user.address_one)
    @registration_atomic_page.address_2_send_text(user.address_too)
    @registration_atomic_page.city_send_text(user.city)
    @registration_atomic_page.postcode_send_text(user.postcode)
    @registration_atomic_page.choose_country_id_option(user.country_id)
    @registration_atomic_page.choose_zone_id_option(user.zone_id)
    @registration_atomic_page.password_send_text(user.password)
    @registration_atomic_page.password_confirm_send_text(user.confirm_password)
    @registration_atomic_page.choose_subscribe_radio_yes_no(user.subscribe)
    @registration_atomic_page.choose_checkbox_policy_value(user.policy)
    @registration_atomic_page.button_continue_click
  end
end

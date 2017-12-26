# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../../tools/search/search'
require_relative '../../pages/login_page/login_selectors_page'

class LoginPage < Search
  def initialize(driver)
    super(driver)
  end

  def login_page_smoke?
    require_elements = [email, password, login_button]
    smoke?(require_elements)
  end

  def email
    @web_driver.find_element(LoginSelectorsPage::EMAIL)
  end

  def password
    @web_driver.find_element(LoginSelectorsPage::PASSWORD)
  end

  def login_button
    @web_driver.find_element(LoginSelectorsPage::LOGIN_BUTTON)
  end

  def forgotten_password_navigation
    @web_driver.find_element(LoginSelectorsPage::FORGOTTEN_PASSWORD_NAVIGATION)
  end

  def login_alert_notification
    wait_for_web_element(LoginSelectorsPage::ALERT_NOTIFICATION)
  end
end

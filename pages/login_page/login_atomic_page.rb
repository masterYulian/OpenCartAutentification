# frozen_string_literal: true

require 'pry'
require_relative 'login_page'

class LoginAtomicPage
  attr_reader :login_page

  def initialize(driver)
    @login_page = LoginPage.new(driver)
  end

  def email_clear_text
    @login_page.email.clear
  end

  def email_send_text(text)
    email_clear_text
    @login_page.email.send_keys(text)
  end

  def password_clear_text
    @login_page.password.clear
  end

  def password_send_text(text)
    password_clear_text
    @login_page.password.send_keys(text)
  end

  def login_button_click
    @login_page.login_button.click
  end

  def forgotten_password_navigation_click
    @login_page.forgotten_password_navigation.click
  end

end
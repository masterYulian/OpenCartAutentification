# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative 'login_page'
require_relative 'login_atomic_page'

class LoginBusinessPage
  def initialize(login_atomic_page)
    @login_atomic_page = login_atomic_page
  end

  def smoke?
    @login_atomic_page.login_page.login_page_smoke?
  end

  def login(user)
    login_action(user)
    LoginBusinessPage.new(LoginAtomicPage.new(@login_atomic_page.login_page.web_driver))
  end

  def print_alert_notification
    login_alert_notification = @login_atomic_page.login_page
                                                 .login_alert_notification.text
    @login_atomic_page.login_page.logger.info login_alert_notification
  end

  def login_action(user)
    @login_atomic_page.email_send_text(user.email)
    @login_atomic_page.password_send_text(user.password)
    @login_atomic_page.login_button_click
  end

  def alert_notification?
    if !@login_atomic_page.login_page.login_alert_notification.nil?
      print_alert_notification
      @login_atomic_page.login_page.logger.info 'Login was unsuccessful'
      true
    else
      @login_atomic_page.login_page.logger.info 'Login was successful'
      false
    end
  end

end

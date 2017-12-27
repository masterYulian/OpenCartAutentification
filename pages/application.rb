# frozen_string_literal: true

require_relative 'login_page/login_page'
require_relative 'registration_page/registration_page'
require_relative 'login_page/login_business_page'
require_relative 'login_page/login_atomic_page'
require_relative 'registration_page/registration_business_page'
require_relative 'registration_page/registration_atomic_page'
require_relative '../data/applications/application_source_repository'
require_relative '../tools/browsers/browser_wrapper'

class Application
  # TODO: for multi threading
  attr_reader :browser, :application_source

  private_class_method :new

  private

  @@instance = nil

  def initialize(application_source)
    @application_source = application_source
  end

  public

  def self.get(application_source = nil, headless = false)
    if @@instance.nil?
      if application_source.nil?
        @application_source = ApplicationSourceRepository.default
      end
      @@instance = new(application_source)
      @@instance.init_browser(application_source, headless)
    end
    @@instance
  end

  def self.remove
    unless @@instance.nil?
      #@@instance.browser.delete_all_cookies
      @@instance.browser.quit
      @@instance = nil
    end
  end

  def init_browser(application_source, headless)
    @browser = BrowserWrapper.new(application_source, headless)
  end

  def user_login_business_page
    browser.delete_all_cookies
    browser.open_url(application_source.user_login_url)
    LoginBusinessPage.new(LoginAtomicPage.new(browser.driver))
  end


  def user_register_business_page
    browser.delete_all_cookies
    browser.open_url(application_source.user_register_url)
    RegistrationBusinessPage.new(RegistrationAtomicPage.new(browser.driver))
  end

  def init_search(application_source)

  end

  def load_home_page
    # TODO: change page load home page
  end

  def logout_user
    # TODO: implement logout user
  end

  def login_admin
    # TODO: implement login_admin page
  end

  def logout_admin
    # TODO: implement logout admin
  end

end
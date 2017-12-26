# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../../data/applications/application_source_repository'
require_relative 'firefox_driver'
require_relative 'chrome_driver'
require_relative '../logger_wrapper'

class BrowserWrapper

  def initialize(application_source, headless)
    init_browser(application_source, headless)
  end

  private

  def init_browser(application_source, headless)
    @web_driver = case application_source.browser_name
                  when 'firefox'
                    FirefoxDriver.new(application_source).driver(headless)
                  when 'chrome'
                    ChromeDriver.new(application_source).driver(headless)
                  else
                    FirefoxDriver.new(application_source).driver(headless)
                  end
  end

  public

  def driver
    @web_driver
  end

  def save_screenshot(path)
    @web_driver.save_screenshot("#{path}#{Time.now.strftime("#{current_title} %d-%m-%Y %H:%M:%S")}.png")
  end

  def quit
    unless @web_driver.nil?
      @web_driver.quit
      @web_driver = nil
      LoggerWrapper.logger.info 'Web driver quit'
    end
  end

  def open_url(url)
    @web_driver.get url
  end

  def current_title
    @web_driver.title
  end

  def navigate_forward
    @web_driver.navigate.forward
  end

  def navigate_back
    @web_driver.navigate.back
  end

  def refresh
    @web_driver.navigate.refresh
  end

  def delete_all_cookies
    @web_driver.manage.delete_all_cookies
  end

  def accept_alert
    @web_driver.switch_to.alert.accept
  end
end


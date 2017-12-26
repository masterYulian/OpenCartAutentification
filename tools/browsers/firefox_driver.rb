# frozen_string_literal: true

require_relative 'driver'

class FirefoxDriver < Driver

  # @return [FireFox web driver]
  def driver(headless)
    options = Selenium::WebDriver::Firefox::Options.new(
      args: ['-headless']
    )
    Selenium::WebDriver::Firefox.driver_path = application_source.driver_path
    web_driver = if headless
                   Selenium::WebDriver.for :firefox, options: options,
                                                     marionette: true
                 else
                   Selenium::WebDriver.for :firefox, marionette: true
                 end
    web_driver.manage.window.maximize
    web_driver.manage.timeouts.implicit_wait = application_source.implicit_wait_timeout
    web_driver.manage.timeouts.page_load = application_source.page_load_timeout
    web_driver.manage.timeouts.script_timeout = application_source.script_timeout
    web_driver
  end

end

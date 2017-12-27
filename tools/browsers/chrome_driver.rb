# frozen_string_literal: true

require_relative 'driver'

class ChromeDriver < Driver

  # @return [Chrome web driver]
  def driver(headless)
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    Selenium::WebDriver::Chrome.driver_path = application_source.driver_path
    web_driver = if headless
                   Selenium::WebDriver.for :chrome, options: options
                 else
                   Selenium::WebDriver.for :chrome
                 end
    web_driver.manage.window.maximize
    web_driver.manage.timeouts.implicit_wait = application_source.implicit_wait_timeout
    web_driver.manage.timeouts.page_load = application_source.page_load_timeout
    web_driver.manage.timeouts.script_timeout = application_source.script_timeout
    web_driver
  end

end
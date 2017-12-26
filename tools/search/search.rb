# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../../data/applications/application_source_repository'
require_relative '../logger_wrapper'
require_relative '../../pages/application'

class Search
  attr_reader :logger, :web_driver

  WEB_ELEMENT_WAIT_TIME = ApplicationSourceRepository.default.explicit_wait_timeout

  def initialize(web_driver)
    @web_driver = web_driver
    @logger = LoggerWrapper.logger
  end

  def smoke?(elements)
    smoke_result = false
    elements.each do |element|
      if element.displayed?
        smoke_result = true
      else
        smoke_result = false
        break
      end
    end
    smoke_result
  end

  def displayed_by_selector?(web_element_selector)
    @web_driver.find_element(web_element_selector).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def wait_for_web_element(web_element_locator)
    wait_for(web_element_locator)
  rescue Selenium::WebDriver::Error::TimeOutError
    LoggerWrapper.logger.info "Web element '#{web_element_locator.values}' was not found"
    nil
  rescue Selenium::WebDriver::Error::NoSuchElementError
    LoggerWrapper.logger.info "Web element '#{web_element_locator.values}' was not found"
    nil
  end

  def wait_for(web_element_locator, seconds = WEB_ELEMENT_WAIT_TIME)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { @web_driver.find_element(web_element_locator) }
  end
end


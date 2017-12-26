# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative '../../tools/search/search'
require_relative 'success_register_selectors_page'

class SuccessRegisterPage < Search
  def initialize(driver)
    super(driver)
  end

  def success_register_smoke?
    return false if describe_paragraphs.size < 2
    require_elements = [account_created_header, continue_button, contact_us_link]
    smoke?(require_elements)
  end

  def account_created_header
    web_driver.find_element(SuccessRegisterSelectorsPage::ACCOUNT_CREATED_HEADER)
  end

  def contact_us_link
    web_driver.find_element(SuccessRegisterSelectorsPage::CONTACT_US_LINK)
  end

  def continue_button
    web_driver.find_element(SuccessRegisterSelectorsPage::CONTINUE_BUTTON)
  end

  def describe_paragraphs
    web_driver.find_elements(SuccessRegisterSelectorsPage::DESCRIBE_PARAGRAPHS)
  end

end
# frozen_string_literal: true

require 'pry'
require_relative 'success_register_page'

class SuccessRegisterAtomicPage
  attr_reader :success_register_page

  def initialize(driver)
    @success_register_page = SuccessRegisterPage.new(driver)
  end

  def account_created_header_text
    @success_register_page.account_created_header.text
  end

  def navigate_to_contact_us
    @success_register_page.contact_us_link.click
  end

  def navigate_to_contact_us_link_text
    @success_register_page.contact_us_link.text
  end

  def describe_paragraphs_text
    describe_paragraphs_text_values = []
    @success_register_page.describe_paragraphs.each do |paragraph|
      describe_paragraphs_text_values.push paragraph.text
    end
    describe_paragraphs_text_values
  end

end
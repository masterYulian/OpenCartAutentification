# frozen_string_literal: true

require 'pry'
require_relative '../../pages/application'
require_relative '../../data/applications/application_source_repository'

class SuccessRegisterLogicPage
  attr_reader :success_register_atomic_page

  def initialize(success_register_atomic_page)
    @success_register_atomic_page = success_register_atomic_page
  end

  def smoke?
    @success_register_atomic_page.success_register_page.success_register_smoke?
  end

  def success_register_atomic_page?
    result = false
    return false unless smoke?
    @success_register_atomic_page.success_register_page.logger
                                 .info 'Register new account was successful'
    @success_register_atomic_page.success_register_page.logger
                                 .info @success_register_atomic_page
      .account_created_header_text
    @success_register_atomic_page.describe_paragraphs_text.each do |item|
      @success_register_atomic_page.success_register_page.logger.info item
    end
    result = success_register_atomic_page.describe_paragraphs_text.size > 2
    return result
  end

end
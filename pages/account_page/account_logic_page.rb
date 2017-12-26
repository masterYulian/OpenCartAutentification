# frozen_string_literal: true

require 'pry'
require 'selenium/webdriver'
require_relative 'account_page'
require_relative 'account_atomic_page'

class AccountLogicPage

  def initialize(account_atomic_page)
    @account_atomic_page = account_atomic_page
  end

  def smoke?
    @account_atomic_page.account_page.account_page_smoke?
  end

end
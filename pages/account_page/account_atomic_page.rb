# frozen_string_literal: true

require 'pry'
require_relative 'account_page'

class AccountAtomicPage

  attr_reader :account_page

  def initialize(driver)
    @account_page = AccountPage.new(driver)
  end

  def account_page_header_text(text)
    account_page.account_page_headers.each do |header|
      header.text if header.text.equal?(text)
    end
  end

  def edit_account_link_click
    account_page.edit_account_link.click
  end

  def change_password_link_click
    account_page.change_password_link.click
  end

  def address_book_link_click
    account_page.address_book_link.click
  end

  def wish_list_link_click
    account_page.wish_list_link.click
  end

  def order_history_link_click
    account_page.order_history_link.click
  end

  def downloads_link_click
    account_page.downloads_link.click
  end

  def reward_point_link_click
    account_page.reward_point_link.click
  end

  def return_requests_link_click
    account_page.return_requests_link.click
  end

  def recurring_payments_link_click
    account_page.recurring_payments_link.click
  end

  def transactions_link_click
    account_page.transactions_link.click
  end

  def subscribe_newsletter_link_click
    account_page.subscribe_newsletter_link.click
  end

end
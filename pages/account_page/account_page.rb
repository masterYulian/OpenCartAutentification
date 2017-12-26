require 'selenium/webdriver'
require_relative '../../tools/search/search'
require_relative '../../pages/account_page/account_selectors'

class AccountPage < Search

  def initialize(driver)
    super(driver)
  end

  def account_page_smoke?
    return false if account_page_headers.empty?
    account_page_headers.each do |header|
      logger.info header.text
    end
    require_elements = [edit_account_link, change_password_link,
                        address_book_link, wish_list_link, transactions_link]
    smoke?(require_elements)
  end

  def account_page_headers
    @web_driver.find_elements(AccountSelectors::ACCOUNT_PAGE_HEADERS)
  end

  def edit_account_link
    @web_driver.find_element(AccountSelectors::EDIT_ACCOUNT_LINK)
  end

  def change_password_link
    @web_driver.find_element(AccountSelectors::CHANGE_PASSWORD_LINK)
  end

  def address_book_link
    @web_driver.find_element(AccountSelectors::ADDRESS_BOOK_LINK)
  end

  def wish_list_link
    @web_driver.find_element(AccountSelectors::WISH_LIST_LINK)
  end

  def order_history_link
    @web_driver.find_element(AccountSelectors::ORDER_HISTORY_LINK)
  end

  def downloads_link
    @web_driver.find_element(AccountSelectors::DOWNLOADS_LINK)
  end

  def reward_point_link
    @web_driver.find_element(AccountSelectors::REWARD_POINTS_LINK)
  end

  def return_requests_link
    @web_driver.find_element(AccountSelectors::RETURN_REQUESTS_LINK)
  end

  def recurring_payments_link
    @web_driver.find_element(AccountSelectors::RECURRING_PAYMENTS_LINK)
  end

  def transactions_link
    @web_driver.find_element(AccountSelectors::TRANSACTIONS_LINK)
  end

  def subscribe_newsletter_link
    @web_driver.find_element(AccountSelectors::SUBSCRIBE_NEWSLETTER_LINK)
  end

end
# frozen_string_literal: true

class AccountSelectors

  ACCOUNT_PAGE_HEADERS = { css: '#content > h2'}.freeze

  EDIT_ACCOUNT_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/edit']" }.freeze

  CHANGE_PASSWORD_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/password']" }.freeze

  ADDRESS_BOOK_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/address']" }.freeze

  WISH_LIST_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/wishlist']" }.freeze

  ORDER_HISTORY_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/order']" }.freeze

  DOWNLOADS_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/download']" }.freeze

  REWARD_POINTS_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/reward']" }.freeze

  RETURN_REQUESTS_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/return']" }.freeze

  TRANSACTIONS_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/transaction']" }.freeze

  RECURRING_PAYMENTS_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/recurring']" }.freeze

  SUBSCRIBE_NEWSLETTER_LINK = { css: "#content li > a[href='http://oppencart.herokuapp.com/index.php?route=account/newsletter']" }.freeze
end
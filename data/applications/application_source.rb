class ApplicationSource

  attr_accessor :implicit_wait_timeout, :page_load_timeout, :script_timeout,
                :explicit_wait_timeout, :driver_path, :base_url, :browser_name,
                :admin_logout_url, :user_login_url, :user_logout_url,
                :admin_login_url, :user_account_url, :user_register_url,

                def initialize()
                  @browser_name = ''
                  @driver_path = ''
                  @implicit_wait_timeout = 10
                  @page_load_timeout = 10
                  @script_timeout = 10
                  @explicit_wait_timeout = 10
                  @base_url = ''
                  @user_login_url = ''
                  @user_logout_url = ''
                  @user_register_url = ''
                  @user_account_url = ''
                  @admin_login_url = ''
                  @admin_logout_url = ''
                end

end
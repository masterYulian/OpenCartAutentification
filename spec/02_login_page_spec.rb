# frozen_string_literal: true

describe 'Login page' do
  before(:all) do
    Application.get(ApplicationSourceRepository.firefox_heroku)
    @login_business_page = Application.get.user_login_business_page
  end

  after(:each) do |_config|
    unless _config.exception.nil?
      _config.attach_file("#{Time.now.strftime("#{Application.get.browser.current_title} %d-%m-%Y %H:%M:%S")}.png",
                          Application.get.browser.save_screenshot('fail_screenshots/login_page/'))
    end
  end

  it 'smoke test', severity: :critical do
    expect(@login_business_page.smoke?).to be true
  end

  $login_data_provider.each do |user, test_description, expected|
    it test_description, severity: :critical do
      expect(@login_business_page.login(user)
                 .alert_notification?).to be expected
    end
  end

end

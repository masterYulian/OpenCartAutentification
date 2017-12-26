# frozen_string_literal: true

describe 'Registration page' do

  before(:all) do
    Application.get(ApplicationSourceRepository.chrome_heroku, true)
    @register_business_page = Application.get.user_register_business_page
  end

  after(:each) do |_config|
    Application.get.browser.delete_all_cookies
    unless _config.exception.nil?
      _config.attach_file("#{Time.now.strftime("#{Application.get.browser.current_title} %d-%m-%Y %H:%M:%S")}.png",
                          Application.get.browser.save_screenshot('fail_screenshots/registration_page/'))
    end
  end

  it 'smoke test' do
    expect(@register_business_page.smoke?).to be true
  end

  context 'fields tests group' do
    it  $registered_email_test_description do
      $log.info $registered_email_test_description
      expect(@register_business_page
                 .alert_notification_identify($invalid_user_email_data)
                 .alert_notification?).to be true
    end

    $valid_email_data_provider.each do |user, test_description, expected|
      it test_description do
        $log.info test_description
        expect(@register_business_page.apply_fields_data(user)
                   .template_email_error_notification?(user.email)).to be expected
      end
    end

    $cyrillic_email_data_provider.each do |user, test_description, expected|
      it test_description  do
        $log.info test_description
        expect(@register_business_page.register(user)
                   .success_register_atomic_page?).to be expected
      end
    end

    $register_email_data_provider.each do |user, test_description, expected|
      it test_description  do
        $log.info test_description
        expect(@register_business_page.apply_fields_data(user)
                   .email_error_notification?).to be expected
      end
    end

  end

  context 'states tests group' do

    it 'should enter one (or) more of required fields is not valid - registration
        must be unsuccessful and error notification(s) must appear', severity: :critical do
      Application.remove
      Application.get(ApplicationSourceRepository.chrome_heroku, false)
      expect(Application.get.user_register_business_page
                 .invalid_data_register($user_required_field_empty)
                 .error_notifications.empty?).to be false
    end

    it 'should set policy checkbox in unchecked state - registration must be unsuccessful
        and error notification(s) must appear', severity: :critical do
      expect(Application.get.user_register_business_page
                 .alert_notification_identify($valid_user_without_policy)
                 .alert_notification?).to be true
    end

    it 'should enter all required fields is valid and not required fields is empty -
        registration must be successful', severity: :critical do
      expect(Application.get.user_register_business_page
                 .register($valid_user_with_not_required_fields_empty)
                 .success_register_atomic_page?).to be true
    end

    it 'should enter all required fields are valid and
        policy checkbox set in checked state - registration must be successful', severity: :critical do
      expect(Application.get.user_register_business_page.register($valid_user_data)
                 .success_register_atomic_page?).to be true
    end

  end

end

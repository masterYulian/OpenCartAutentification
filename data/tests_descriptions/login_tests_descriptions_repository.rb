# frozen_string_literal: true

require_relative '../users/user'
require_relative '../../tools/parse_data'
require_relative '../users/user_repository'

class LoginTestsDescriptionsRepository
  private_class_method :new

  DATA_PATH = 'resources/login_tests_descriptions.yaml'

  def self.valid_login_test_description
    data = login_tests_description_data('login_spec_data')
    data['valid_login_test_description']
  end

  def self.invalid_login_test_description
    login_tests_description_data('login_spec_data')['invalid_login_test_description']
  end

  def self.login_tests_description_data(_yaml_data_id)
    ParseData.parsed_yaml_file_data(DATA_PATH)[_yaml_data_id]
  end
end

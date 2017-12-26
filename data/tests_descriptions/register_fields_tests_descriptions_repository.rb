# frozen_string_literal: true

require_relative '../users/user'
require_relative '../../tools/parse_data'

class RegisterFieldsTestsDescriptionsRepository
  private_class_method :new

  DATA_PATH = 'resources/register_fields_tests_descriptions.yaml'

  def self.valid_email_test_description
    login_tests_description_data('register_fields_spec_data')['valid_email_test_description']
  end

  def self.blank_email_test_description
    login_tests_description_data('register_fields_spec_data')['blank_email_test_description']
  end

  def self.registered_email_test_description
    login_tests_description_data('register_fields_spec_data')['registered_email_test_description']
  end

  def self.cyrillic_email_test_description
    login_tests_description_data('register_fields_spec_data')['cyrillic_email_test_description']
  end

  def self.at_symbol_miss_email_test_description
    login_tests_description_data('register_fields_spec_data')['at_symbol_miss_email_test_description']
  end

  def self.login_tests_description_data(_yaml_data_id)
    ParseData.parsed_yaml_file_data(DATA_PATH)[_yaml_data_id]
  end

end

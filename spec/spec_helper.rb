# frozen_string_literal: true

require 'allure-rspec'
require 'pry'
require 'rspec'
require_relative '../data/applications/application_source_repository'
require_relative '../data/tests_descriptions/login_tests_descriptions_repository'
require_relative '../data/tests_descriptions/register_fields_tests_descriptions_repository'
require_relative '../data/users/user_repository'
require_relative '../pages/application'
require_relative '../tools/search/search'
require_relative '../tools/logger_wrapper'
require 'selenium-webdriver'

RSpec.configure do |_config|

  _config.include AllureRSpec::Adaptor

  $valid_user_data = UserRepository.valid_user_data

  $invalid_user_email_data = UserRepository.invalid_user_email_data

  $user_required_field_empty = UserRepository.invalid_user_required_fields_empty_data

  $valid_user_without_policy = UserRepository.valid_user_without_policy

  $valid_user_with_not_required_fields_empty = UserRepository.valid_user_with_not_required_fields_empty

  $login_data_provider = [
    [UserRepository.invalid_user_login_data,
     LoginTestsDescriptionsRepository.invalid_login_test_description, true],
    [UserRepository.valid_user_login_data,
     LoginTestsDescriptionsRepository.valid_login_test_description, false]
  ]

  $register_email_data_provider = [
    [UserRepository.blank_email_data,
     RegisterFieldsTestsDescriptionsRepository.blank_email_test_description, true],
    [UserRepository.at_symbol_miss_email_data,
     RegisterFieldsTestsDescriptionsRepository.at_symbol_miss_email_test_description, true],
  ]

  $valid_email_data_provider = [
    [UserRepository.valid_email_data,
     RegisterFieldsTestsDescriptionsRepository.valid_email_test_description, false]
  ]

  $cyrillic_email_data_provider = [
    [UserRepository.cyrillic_email_data,
     RegisterFieldsTestsDescriptionsRepository.cyrillic_email_test_description, false]
  ]

  $registered_email_test_description = RegisterFieldsTestsDescriptionsRepository.registered_email_test_description

  $log = LoggerWrapper.logger

  _config.after(:all) do
    LoggerWrapper.logger.fatal 'before after all del cookies'
    Application.remove
    LoggerWrapper.logger.fatal 'after after all del cookies'
  end

  AllureRSpec.configure do |config|
    config.output_dir = 'reports/allure/gen/allure-results'
    config.logging_level = Logger::WARN
  end
end

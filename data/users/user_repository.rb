# frozen_string_literal: true

require_relative 'user'
require_relative '../../tools/parse_data'

class UserRepository

  private_class_method :new

  TEST_USERS_DATA_PATH = 'resources/users_data.yaml'

  def self.default
    valid_user_data
  end

  def self.valid_user_data
    assign_user_data_properties('valid_user_credentials')
  end

  def self.valid_user_without_policy
    assign_user_data_properties('valid_user_without_policy')
  end

  def self.valid_user_with_not_required_fields_empty
    assign_user_data_properties('valid_user_with_not_required_fields_empty')
  end

  def self.invalid_user_email_data
    assign_user_data_properties('invalid_user_email_credentials')
  end

  def self.invalid_user_required_fields_empty_data
    assign_user_data_properties('invalid_user_required_fields_empty')
  end

  def self.valid_user_login_data
    assign_user_data_properties('valid_user_login_data')
  end

  def self.valid_email_data
    assign_user_data_properties('valid_email_data')
  end

  def self.cyrillic_email_data
    assign_user_data_properties('cyrillic_email_data')
  end

  def self.blank_email_data
    assign_user_data_properties('blank_email_data')
  end

  def self.at_symbol_miss_email_data
    assign_user_data_properties('at_symbol_miss_email_data')
  end

  def self.email_regex
    /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end

  def self.invalid_user_login_data
    assign_user_data_properties('invalid_user_login_data')
  end

  def self.assign_user_data_properties(_yaml_data_task)
    user_data = User.new
    test_user_data(_yaml_data_task).each do |key, value|
       user_data.send :"#{key.to_s}=", value.to_s
     end
    user_data
  end

  def self.test_user_data(_yaml_data_id)
    ParseData.parsed_yaml_file_data(TEST_USERS_DATA_PATH)[_yaml_data_id]
  end

end

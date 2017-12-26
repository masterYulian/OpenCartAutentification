# frozen_string_literal: true

require 'pry'
require_relative 'application_source'
require_relative '../../tools/parse_data'
require_relative '../../tools/logger_wrapper'

class ApplicationSourceRepository

  private_class_method :new

  APPLICATION_SOURCE_DATA_PATH = 'resources/application_source.yaml'

  def self.default
    firefox_heroku
  end

  def self.firefox_heroku
    assign_driver_data_properties('firefox')
  end

  def self.chrome_heroku
    assign_driver_data_properties('chrome')
  end

  def self.assign_driver_data_properties(_yaml_data_task)
    driver_data = ApplicationSource.new
    application_source_driver_data(_yaml_data_task).each do |key, value|
      driver_data.send :"#{key.to_s}=", value
    end
    driver_data
  end

  def self.application_source_driver_data(_yaml_data_id)
    ParseData.parsed_yaml_file_data(APPLICATION_SOURCE_DATA_PATH)[_yaml_data_id]
  end

end

require 'pry'
require 'selenium/webdriver'

class Driver

  attr_reader :application_source

  def initialize(application_source)
    @application_source = application_source
  end

  def driver
    raise "You can't call this method because it is is abstract!"
  end
end
require_relative 'base_class_for_data_classes'

class Error < BaseClassForDataClasses
  attr_accessor :code,
                :kind,
                :error,
                :general_problem

      # ERROR = {:error_message => "One or more request parameters was missing or invalid."}

  def initialize(values = {})
    super(values)
  end
end
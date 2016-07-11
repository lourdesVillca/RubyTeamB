require_relative 'base_class_for_data_classes'

class Epic < BaseClassForDataClasses
  attr_accessor :id,
                :kind,
                :created_at,
                :updated_at,
                :project_id,
                :name,
                :url,
                :label

  def initialize(values = {})
    super(values)
  end

end
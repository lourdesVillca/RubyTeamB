require_relative 'base_class_for_data_classes'

class Workspace < BaseClassForDataClasses
  attr_accessor :id,
                :kind,
                :name,
                :person_id,
                :project_ids

  def initialize(values = {})
    super(values)
  end

end
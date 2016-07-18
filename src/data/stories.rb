require_relative 'base_class_for_data_classes'
#preguntar por esta mierda
class Stories < BaseClassForDataClasses
  attr_accessor :kind,
                :id,
                :labels,
                :created_at,
                :updated_at,
                :story_type,
                :name,
                :current_state,
                :requested_by_id,
                :url,
                :project_id,
                :owner_ids

  def initialize(values = {})
    super(values)
  end

end
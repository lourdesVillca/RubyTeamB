require_relative '../../src/requests/project_request/project_request'
require_relative '../../src/helpers/rest_client/api_rest_client'

Before('@create_project') do
  client = ApiRestClient.new
  #create the project
  json_param = {:name => "General_project01"}
  _,$project = ProjectRequest.create_project(client,"POST",json_param.to_json)


end

After('@delete_project') do
  #delete  project
  client = ApiRestClient.new
  ProjectRequest.delete_project(client,"DELETE",$project.id)
end

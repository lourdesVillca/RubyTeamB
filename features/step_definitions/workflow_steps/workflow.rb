require_relative '../../../src/requests/project_request/project_request'
require_relative '../../../src/requests/stories_get/stories_request'
require_relative '../../../src/helpers/data_helper'

When(/^I send project (POST) request for a project with json$/) do |method, json_text|
  @json_value = json_text
  @http_response, $project = ProjectRequest.create_project(@client, method, json_text)
  @json_response = JSON.parse(@http_response.body)

end

When(/^I send story (POST) request to belong to the created project with the json$/) do |method, json_text|
  @http_response, @stories = StoriesRequest.create_stories(@client, method, $project.id, json_text)
end

When(/^I send a epic (POST) request to belong to the created project with the json$/) do |method, json_text|
  @json_value = json_text
  @http_response, @epic = EpicRequest.create_epic(@client, method, $project.id, json_text)
  @json_response = JSON.parse(@http_response.body)
end
When(/^I send a Comments (POST) request for a created story with the json$/) do |method, json_text|
  @http_response, @comments = CommentsRequest.create_comments(@client, method, $project.id, @stories.id, json_text)
end

When(/^I add a workspaces (POST) request to add a created project with json$/) do |method, json_text|
  @http_response, $workspace = WorkspaceRequest.create_ind_workspace(@client,method,json_text)

end
When(/^I (PUT) the created project to workspace$/) do |method|
  json_text = {:project_ids=> [$project.id]}
  @http_response = WorkspaceRequest.update_workspace(@client, method, $workspace.id, json_text.to_json)
end

When(/^I (DELETE) the created project$/) do |method|
  @http_response, _= ProjectRequest.delete_project(@client, method, $project.id)
end

When(/^I (DELETE) the created workspace$/) do |method|
  @http_response = WorkspaceRequest.delete_workspace(@client, method, $workspace.id)
end


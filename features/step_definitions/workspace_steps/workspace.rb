require_relative '../../../src/helpers/data_helper'
require_relative '../../../src/requests/workspace_request/workspace_request'
require_relative '../../../src/helpers/rest_client/api_rest_client'

# SMOKES
When(/^I send a workspace (GET) request to$/) do |method|
    @http_response = WorkspaceRequest.get_workspace(@client, method)
end

When(/^I send a workspace (POST) with the json$/) do |method, json_text|
    @http_response, $workspace = WorkspaceRequest.create_ind_workspace(@client,method,json_text)
end

When(/^I send a workspace (PUT) request to add project$/) do |method|
    json_text = {:project_ids=> [$project.id]}
    @http_response = WorkspaceRequest.update_workspace(@client, method, $workspace.id, json_text.to_json)
end

When(/^I send a workspace (DELETE) request to delete WorkspaceRequest$/) do |method|
    @http_response = WorkspaceRequest.delete_workspace(@client, method, $workspace.id)
    # p "#{@http_response.body}"
end



# ACCEPTANCES
When(/^I send a workspace (POST) request with the json$/) do |method, json_text|
    @json_value = json_text
    @http_response, $workspace = WorkspaceRequest.create_ind_workspace(@client, method, json_text)
    @json_response = JSON.parse(@http_response.body)
    WorkspaceRequest.delete_workspace(@client,"DELETE",$workspace.id)
end

And(/^I expect the all inserted data are the same$/) do
    res = true
    @json_value = JSON.parse(@json_value)
    @json_value.each do |key, value|
            if (!@json_response[key] == value)
              res = false
            end
        end
        expect(res).to be true
    end
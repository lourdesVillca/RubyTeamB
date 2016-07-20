require_relative '../../../src/data/workspace'
require_relative '../../../src/helpers/rest_client/api_rest_client'

class WorkspaceRequest

  def self.create_workspace(client, method, json)#POST
    end_point = '/my/workspaces'
    http_request = client.get_request(method, end_point)
    http_request.body = json.to_json

    @http_response = client.execute_request(client.get_connection, http_request)
    obj_workspace = JSON.parse(@http_response.body)
    var = DataHelper.rehash_to_symbol_keys(obj_workspace)
    obj_workspace = Workspace.new(var)
    obj_workspace
  end

  def self.get_workspace(client, method) #GET
    end_point = '/my/workspaces'
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

  def self.create_ind_workspace(client, method, json)#POST
    end_point = '/my/workspaces/'
    http_request = client.get_request(method, end_point)
    http_request.body = json
    http_response = client.execute_request(client.get_connection, http_request)
    @obj_workspace = JSON.parse(http_response.body)
    var = DataHelper.rehash_to_symbol_keys(@obj_workspace)
    @obj_workspace = Workspace.new(var)
    p "from create method #{http_response}"
    return http_response, @obj_workspace
  end

  def self.update_workspace(client, method, id_workspace, json_text) #PUT
    end_point = '/my/workspaces/%s' %id_workspace
    http_request = client.get_request(method, end_point)
    http_request.body = json_text
    http_response = client.execute_request(client.get_connection, http_request)
    p "WORKSPACE put #{http_response.body}"
    http_response
  end

  def self.delete_workspace(client, method, id_workspace)
    end_point = '/my/workspaces/%s' %id_workspace
    http_request = client.get_request(method, end_point)
    @http_response = client.execute_request(client.get_connection, http_request)
  end

end
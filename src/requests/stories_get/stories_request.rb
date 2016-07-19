require_relative '../../../src/data/stories'
require_relative '../../helpers/data_helper'
class StoriesRequest
#que es client???
  def self.get_stories(client, method, id_project)#GET
    end_point = '/projects/%s/stories/' % id_project
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

  def self.create_stories(client, method, id_project, json_text) #POST
    end_point = '/projects/%s/stories' % id_project
    http_request = client.get_request(method, end_point)
    http_request.body = json_text
    http_response = client.execute_request(client.get_connection, http_request)
    obj_stories = JSON.parse(http_response.body)
    var = DataHelper.rehash_to_symbol_keys(obj_stories)
    obj_stories = Stories.new(var)
    return http_response, obj_stories
  end
#Story
  def self.update_story(client, method, id_project, json_text, id_story) #PUT
    end_point = '/projects/%s/stories/%s' % [id_project, id_story]
    http_request = client.get_request(method, end_point)
    http_request.body = json_text
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

  def self.delete_story(client, method, id_project, id_story) #DELETE
    end_point = '/projects/%s/stories/%s' % [id_project, id_story]
    http_request = client.get_request(method, end_point)
    http_response = client.execute_request(client.get_connection, http_request)
    http_response
  end

end

When(/^I send a (GET) request to (.*?)$/) do |method, end_point|
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @http_response.body

end

When(/^I send a (PUT|POST) request to (.*?)$/) do |method, end_point, json_text|
  http_request = @client.get_request(method, end_point)
  http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, http_request)
  @last_json = @http_response.body
end

When(/^I send a workspace (DELETE) request to (.*?)$/) do |method, end_point|
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @last_json = @http_response.body

end
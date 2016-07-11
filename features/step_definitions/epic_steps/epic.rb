
When(/^I send a epic (GET) request to (.*?)$/) do |method, end_point|
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)

end
When(/^I send an epic (PUT|POST) request to (.*?) with json$/) do |method, end_point, json_text|
  http_request = @client.get_request(method, end_point)
  http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, http_request)

end

When(/^I send an epic (DELETE) request to (.*?)$/) do |method, end_point|
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)

end

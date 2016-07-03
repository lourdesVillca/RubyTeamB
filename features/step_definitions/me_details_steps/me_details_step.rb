require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/me_details'

Given(/^I have set a connection to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
end

When(/^I send a GET request to (.*?)$/) do |end_point|
  @status_code, @response = @client.get(end_point)
end

Then(/^I expect Status code (\d+)$/) do |http_code|
  expect(@status_code.to_s).to eql(http_code.to_s)
end

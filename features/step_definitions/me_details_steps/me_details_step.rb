
require 'json/ext'
require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/me_details'

Given(/^I have set a connection to pivotal_tracker API service$/) do
	@client = ApiRestClient.new
 	@http_connection = @client.get_connection
end

When(/^I send a (GET) request to (.*?)$/) do |method, end_point|
	http_request = @client.get_request(method, end_point)	
	@http_response = @client.execute_request(@http_connection, http_request)  
	@http_response.body
	parser = JSON::Ext::Parser.new(@http_response.body)
	json = parser.parse
	object = DataHelper.rehash_to_symbol_keys(json)
	p me_details = MeDetails.new(object)
end

Then(/^I expect Status code (\d+)$/) do |http_code|
  expect(@http_response.code.to_s).to eql(http_code.to_s)
end

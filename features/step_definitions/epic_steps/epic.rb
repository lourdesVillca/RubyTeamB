require_relative '../../../src/requests/epic_get/epic_request'
require_relative '../../../src/helpers/data_helper'

When(/^I send a epic (GET) request for a project$/) do |method|
  @http_response = EpicRequest.get_epics(@client, method, $project.id)
  array_epic_json = JSON.parse(@http_response.body)
  @array_epic1 = []
  array_epic_json.each do | epic |
    var = DataHelper.rehash_to_symbol_keys(epic)
    obj_epic = Epic.new(var)
    @array_epic1.push(obj_epic)
  end

end
When(/^I send an epic (POST) with the json2$/) do |method, json_text|
  @http_response, $epic = EpicRequest.create_epic(@client, method, $project.id, json_text)

end

When(/^I send an epic (PUT) request to EpicRequest with json$/) do |method, json_text|
  @http_response = EpicRequest.update_epic(@client, method, $project.id, json_text, $epic.id)

end

When(/^I send an epic (DELETE) request to EpicRequest$/) do |method|
   @http_response = EpicRequest.delete_epic(@client, method, $project.id, $epic.id)

end

When(/^I send an epic (POST) with the json$/) do |method, json_text|
  @json_value = json_text
  @http_response, @epic = EpicRequest.create_epic(@client, method, $project.id, json_text)
  @json_response = JSON.parse(@http_response.body)
end

And(/^I expect the all inserted data are the same that the data sent$/) do
    result = false
    @json_value = JSON.parse(@json_value)
    result = DataHelper.contain_same_value?(@json_value, @json_response)
    expect(result).to be true

end
And(/^I expect the all date format are correct$/) do
  result = false
  @json_value = JSON.parse(@json_value)
  result = DataHelper.is_timestamp?(@json_response["created_at"]) && DataHelper.is_timestamp?(@json_response["updated_at"])
  expect(result).to be true

end

And(/^I expect the kind of epic is equal to (.*)$/) do |kind_epic|
  result = false
  @json_value = JSON.parse(@json_value)
  expect(@json_response["kind"] == kind_epic).to be true

end
And(/^I expect the project_id is the same that I have sent$/) do
  result = false
  @json_value = JSON.parse(@json_value)
  expect(@json_response["project_id"] == $project.id).to be true

end
And(/^I expect the all data type returned from epic request are correct$/) do
  @array_string_name = @array_epic1.map{|epic| epic.name }
  @array_integer_id = @array_epic1.map{|epic| epic.id }
  @array_string_kind = @array_epic1.map{|epic| epic.kind }

  expect(DataHelper.is_string_array?(@array_string_name)).to be true
  expect(DataHelper.is_integer_array?(@array_integer_id)).to be true
  expect(DataHelper.is_string_array?(@array_string_kind)).to be true

end
When(/^I send a epic (GET) request for a project (.*?)$/) do |method, id_no_exist|
  @http_response, $epic = EpicRequest.get_epics(@client, method, id_no_exist)

end

And(/^I expect an error message to epic$/) do
  p @http_response.code
  @json_response = JSON.parse(@http_response.body)
  expect(@json_response["error"]).to eql(Epic::ERROR[:error_message])
end




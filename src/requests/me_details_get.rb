require_relative '../data/me_details'

class MeDetailsGet
  def self.call_and_return_response(client)
    url_elements = %w/
      me
    /
    status_code, response_body = client.get(url_elements)
    me_details = MeDetails.new(response_body)
    [status_code, me_details]
  end

  def self.validate_me_details(client)
    status_code, me_details = self.call_and_return_response(client)

    # More Validations
    status_code
  end
end
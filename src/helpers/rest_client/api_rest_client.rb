require 'rest-client'
require 'uri'
require 'json/ext'

require_relative '../config/configuration'
require_relative '../data_helper'

class ApiRestClient

  def initialize
    @config = Configuration.new
    @base_url = @config.get('url')
    @time_out = @config.get('time_out')

    @account_name = @config.get('account/name')
    @password = @config.get('account/password')
    @token = @config.get('account/token')

    nil
  end

  # Do one of the above.
  def client_method(rest_method, url_elements, query_elements = [], parameters = nil)
    url = File.join(@base_url, *url_elements)
    url = URI.escape(url)
    query_elements.each_with_index do |s, i|
      char = (i == 0) ? '?' : '&'
      url = '%s%s%s' % [url, char, s]
    end

    args = Hash.new

    args.store(:method, rest_method)
    args.store(:url, url)
    args.store(:timeout, @time_out)
    headers = {
        'content-type' => 'application/json',
        'X-TrackerToken' => @token
    }
    if parameters.nil?
      parameters_json = nil
    else
      parameters_json = parameters.to_json
    end
    args.store(:user, @account_name)
    args.store(:password, @password)
    args.store(:payload, parameters_json)
    args.store(:headers, headers)

    # noinspection RubyResolve
    args.store(:verify_ssl, OpenSSL::SSL::VERIFY_NONE)

    RestClient.proxy = "http://172.20.240.5:8080"
    response = RestClient::Request.execute(args)
    # Don't parse as Json if empty.
    return response if response == ''
    begin
      parser = JSON::Ext::Parser.new(response)
      json = parser.parse
      json = DataHelper.rehash_to_symbol_keys(json)
      return [response.code, json]
    rescue
      # Isn't Json.
      return [response.code, response]
    end
  end

  # Get.
  def get(url_elements, query_elements = [])
    client_method(__method__, url_elements, query_elements)
  end

  # Post.
  def post(url_elements, query_elements = [], parameters = nil)
    client_method(__method__, url_elements, query_elements, parameters)
  end

  # Put.
  def put(url_elements, query_elements = [], parameters = nil)
    client_method(__method__, url_elements, query_elements, parameters)
  end

  # Delete.
  def delete(url_elements, query_elements = [], parameters = nil)
    client_method(__method__, url_elements, query_elements, parameters)
  end
end
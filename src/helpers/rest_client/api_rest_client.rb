require 'json/ext'
#Add the library for HTTP
require 'net/http'
require 'openssl'

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
  #
  # This method set up a connection 
  #
  def get_connection
      uri = URI.parse(@base_url)
      http_connection = nil
      http_connection = Net::HTTP.new(uri.host, uri.port)
      http_connection.use_ssl = true
      http_connection.verify_mode = OpenSSL::SSL::VERIFY_NONE      
      http_connection.read_timeout = @time_out
      http_connection
  end

  def get_request(method, url)
    request = nil   
    url =  @base_url + url  

    uri = URI.parse(url)
   
    case method
      when "POST"
        request = Net::HTTP::Post.new(uri)
      when "PUT"
        request = Net::HTTP::Put.new(uri)
      when "DELETE"
        request = Net::HTTP::Delete.new(uri)
      when "GET"
        request = Net::HTTP::Get.new(uri)
    end

    request.basic_auth(@account_name, @password)
    request.add_field("X-TrackerToken", @token)  
    request.add_field("content-type", 'application/json')
    request.add_field("'accept'", 'application/json')
    request
  end

  def execute_request(http_connection, http_request)
    http_connection.request(http_request)
  end

end
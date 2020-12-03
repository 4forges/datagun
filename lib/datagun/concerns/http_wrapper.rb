# frozen_string_literal: true

require 'rest-client'
require 'json'
#
# Decorator class for RestClient, mainly used to add the authorization headers
#
class HttpWrapper
  attr_accessor :payload
  attr_writer :endpoint

  def initialize(base_url:)
    @base_url = base_url
    @headers = {
      'Authorization': Datagun.config.api_key
    }
  end

  def post
    res = RestClient.post(url, payload, @headers)
    JSON.parse(res.body)['data']
  rescue RestClient::ExceptionWithResponse => e
    JSON.parse(e.response)['data']
  rescue StandardError => e
    { error: e.message }
  end

  def get
    res = RestClient.get(
      url,
      {
        Authorization: Datagun.config.api_key,
        params: payload
      }
    )
    JSON.parse(res.body)['data']
  rescue RestClient::ExceptionWithResponse => e
    JSON.parse(e.response)['data']
  rescue StandardError => e
    { error: e.message }
  end

  def delete
    res = RestClient.delete(url, { Authorization: Datagun.config.api_key })
    JSON.parse(res.body)['data']
  rescue StandardError => e
    { error: e.message }
  end

  private

  def url
    "#{@base_url}/#{@endpoint}"
  end
end

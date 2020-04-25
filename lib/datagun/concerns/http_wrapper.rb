# frozen_string_literal: true

require 'rest-client'
require 'json'
#
# Decorator class for the RestClient, mainly used to add the headers with authorization
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
    JSON.parse(RestClient.post(url, payload, @headers).body)
  rescue StandardError => e
    { data: { error: e.message } }
  end

  def get
    JSON.parse(RestClient.get(url, { Authorization: Datagun.config.api_key, params: payload }).body)
  rescue StandardError => e
    { data: { error: e.message } }
  end

  def url
    "#{@base_url}/#{@endpoint}"
  end
end

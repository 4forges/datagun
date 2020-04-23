# frozen_string_literal: true

#
# Decorator class for the HTTParty, mainly used to add the headers with authorization
#
class HttpWrapper
  attr_accessor :url, :query, :body

  def initialize(url:)
    @url = url
    @payload = {}
    @payload[:headers] = {
      'Authorization': Datagun.config.api_key
    }
    @payload[:query] = query
    @payload[:body] = body if body.present?
  end

  def post
    HTTParty.post(url, payload)
  end

  def get
    HTTParty.get(url, payload)
  end

  private

  def payload
    @payload[:query] = query if query.present?
    @payload[:body] = body if body.present?
  end
end

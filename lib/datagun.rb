# frozen_string_literal: true

require 'logger'

require 'datagun/version'
require 'datagun/configuration'
require 'datagun/concerns/http_wrapper'

require 'datagun/api/base'
require 'datagun/api/keywords_extractor/client'

module Datagun
  class Error < StandardError; end
  class << self
    attr_accessor :config

    def configure
      self.config = Datagun::Configuration.new
      yield(config)
    end
  end
end

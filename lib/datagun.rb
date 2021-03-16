# frozen_string_literal: true

require 'logger'

require 'datagun/version'
require 'datagun/configuration'
require 'datagun/concerns/http_wrapper'

require 'datagun/api/base'
require 'datagun/api/community_detection/client'
require 'datagun/api/image_hash/client'
require 'datagun/api/keywords_extractor/client'
require 'datagun/api/tokenizer/client'
require 'datagun/api/entities/client'

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

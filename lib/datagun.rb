# frozen_string_literal: true

require 'datagun/version'
require 'datagun/configuration'

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

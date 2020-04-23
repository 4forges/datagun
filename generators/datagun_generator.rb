# frozen_string_literal: true

require 'rails/generators'

# Creates the Datagun initializer file for Rails apps.
#
# @example Invokation from terminal
#   rails generate datagun
#
class DatagunGenerator < Rails::Generators::Base
  desc "Description:\n  This creates a Rails initializer for Datagun"

  source_root File.expand_path('templates', __dir__)

  desc 'Configures Datagun to connect to Datagun api'
  def generate_layout
    template 'initializer.rb', 'config/initializers/datagun.rb'
  end
end

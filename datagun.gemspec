# frozen_string_literal: true

require_relative 'lib/datagun/version'

Gem::Specification.new do |spec|
  spec.name          = 'datagun'
  spec.version       = Datagun::VERSION
  spec.authors       = ['Duccio Giovannelli']
  spec.email         = ['giovannelli@extendi.it']

  spec.summary       = spec.description
  spec.description   = 'A Ruby interface to the Datagun API.'
  spec.homepage      = 'https://github.com/4forges/datagun'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/4forges/datagun/blob/master/CHANGELOG.md'
  spec.post_install_message = '
    To enable datagun api please run
    rails g datagun
  '
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rest-client', '~> 2.1.0'
end

require File.expand_path('../lib/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'tenk'
  s.version     = Tenk::VERSION
  s.date        = '2017-01-25'
  s.summary     = 'An unofficial ruby gem for the 10,000ft API'
  s.description = 'This gem provides an API wrapper for working with the 10k plans API.'
  s.authors     = ['Robert Prehn']
  s.email       = 'prehnra@gmail.com'
  s.files       = Dir['{lib}/**/*']
  s.homepage    =
    'http://rubygems.org/gems/tenk'
  s.license     = 'MIT'

  s.executables << 'tenk'

  s.add_dependency 'hashie',      '>= 3'
  s.add_dependency 'faraday',     '~> 0.8', '< 0.16'
  s.add_dependency 'activesupport', '>= 3'

  s.add_development_dependency 'bundler', '~> 1'
  s.add_development_dependency 'rake', '< 11.0'
  s.add_development_dependency 'coveralls', '= 0.8.22'
end

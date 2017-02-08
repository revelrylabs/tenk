require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

FileList['tasks/**/*.rake'].each(&method(:import))

task default: [:spec, :features]

namespace :doc do
  begin
    require 'yard'
    YARD::Rake::YardocTask.new do |task|
      task.files   = ['lib/**/*.rb']
      task.options = [
        '--output-dir', 'doc/yard',
        '--markup', 'markdown',
      ]
    end
  rescue LoadError
  end
end

require 'rubygems'
require 'rake'
#adfa
#dfasf
#asdfas
begin
  require 'rspec/core/rake_task'

  desc 'Default: run specs.'
  task :default => :spec

  desc "Run specs"
  RSpec::Core::RakeTask.new do |t|
    t.pattern = ["./spec/**/*_spec.rb"]
  end

  desc "Gessnerate code coverage"
  RSpec::Core::RakeTask.new(:coverage) do |t|
    t.pattern = ["./spec/**/*_spec.rb"]
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
rescue LoadError => e
  p "couldn't load rspec"
end

begin
  require 'tasks/standalone_migrations'
rescue LoadError => e
  puts "gem install standalone_migrations to get db:migrate:* tasks! (Error: #{e})"
end

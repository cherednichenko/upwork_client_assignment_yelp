require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Dir[File.dirname(__FILE__) + '../lib/tasks'].each {|file| require file }

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

namespace :tests do
  desc "Tests by iterations"

  task :iterations, :name, :times do |task,args|
    puts "Executing feature: #{args[:name]} #{args[:times]} times"
    cucumber_opts = "features/#{args[:name]}"
    args[:times].to_i.times { Rake::Task[:features].execute }
  end
end

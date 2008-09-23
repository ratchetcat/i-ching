require 'rake'
require 'rake/testtask'

desc "Default Task"
task :default => [ :test ]

desc "Run all the tests"
Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['tests/*.rb']
    t.verbose = true
end

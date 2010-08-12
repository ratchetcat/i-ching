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

desc "Cast"
task :cast do
	require 'lib/iching'
	cast = IChing::Cast.new
	cast.hexagrams.each do | h |
		puts
		puts h.to_s
		puts h.description[:name]
		h.moving_lines.each { | l | puts "lines #{ l }" }
	end
end

require 'minitest/autorun'
require 'minitest/pride'
require 'rake/testtask'
require 'simplecov'
SimpleCov.start

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
end
desc "Run tests"

task default: :test

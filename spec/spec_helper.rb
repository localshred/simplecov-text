require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'fakefs/safe'
require 'simplecov'

$: << File.expand_path('../../lib', __FILE__)
require 'simplecov-text'

RSpec.configure do |config|
  config.before(:suite) do
    FakeFS.activate!
  end
  
  config.after(:suite) do
    FakeFS.deactivate!
  end
end
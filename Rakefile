#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new(:spec) do |t|
   t.libs << "libs"
   t.test_files = FileList['spec/*_spec.rb']
 end
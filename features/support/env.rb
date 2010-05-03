$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require "rubygems"
require "bundler"
Bundler.setup(:cucumber)

require 'aruba'


# require 'inline_tests'

# require 'spec/expectations'

def install_this_gem
  rvm_gemset = "inlinetests-isolated"
  use_rvm("1.8.7")
  use_rvm_gemset(rvm_gemset, true)
  install_gems(%{
    gem 'rake'
    gem 'jeweler'
    gem 'rspec'
    gem 'cucumber'
    gem 'open_gem'
    gem "commander", :path => "~/Projects/github/commander"
  })
  run("rake install")
end
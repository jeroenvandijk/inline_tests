require "rubygems"
require "bundler"
Bundler.setup

require 'test/unit'
class InlineTest < Test::Unit::TestCase
end

require 'commander'


# require 'rubygems'
# require 'spec'
# require 'spec/autorun'
# exit ::Spec::Runner::CommandLine.run

class Module
  def method_added(method_name)
    unless method_name.to_s =~ /method_added$/
      constant_name = self.name
      Commander.add_command(constant_name, method_name.to_s, caller) 
    end
  end    
end
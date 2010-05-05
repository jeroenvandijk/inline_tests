require 'rubygems'
# require 'bundler'
# 
# Bundler.setup(:default)
# gem 'rspec', '1.3.0'

require 'spec'

module InlineTests
  module Runners
    
    class RSpec
      def self.run(definitions)
        definitions.each do |definition|
          describe definition.context do
            subject { definition.subject }
            eval(definition.comment, binding, definition.filename, definition.line)
          end
          
        end

        ::Spec::Runner::CommandLine.run
      end
      
    end
  end  
end
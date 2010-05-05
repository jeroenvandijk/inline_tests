require 'test/unit'

module InlineTests
  module Runners
    class TestUnitCase < Test::Unit::TestCase; end    
    
    class TestUnit
      def self.run(definitions)
        definitions.each do |definition|
          TestUnitCase.class_eval(definition.comment, definition.filename, definition.line )
        end
      end
      
    end
  end  
end
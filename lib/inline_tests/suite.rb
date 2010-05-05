require 'inline_tests/definitions/base'
require 'inline_tests/definitions/method'

module InlineTests
  class Suite

    class << self

      attr_writer :definitions
      def definitions
        @definitions ||= []
      end
      
      attr_reader :active
      def activate
        @active = true
      end
      
      def deactivate
        @active = false
      end

      def parse(details = {})
        # puts details.inspect
        return unless active
          
        if details[:method]
          self.definitions << Definitions::Method.new(details)
        end
      end
      
      attr_writer :runner
      def runner
        case @runner
        when :rspec 
          require 'inline_tests/runners/rspec'
          Runners::RSpec
        else
          require 'inline_tests/runners/test_unit'
          @runner = Runners::TestUnit        
        end
      end
            
      def run
        deactivate
        runner.run(definitions)
      end
      
    end
    
  end
end
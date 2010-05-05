
module InlineTests
  module Definitions
    class Method < Base
      attr_reader :context

      def initialize(details = {})
        super
        @context = details[:context]
      end
      
      def subject
        method_context = eval("#{context}")
        
        if method_context.is_a?(Module)
          Object.new.extend(method_context)
        else 
          method_context.new
        end
      end
      
      def instance_method?
        true
      end

      def arguments
        @arguments ||= extract_arguments
      end
    
      private
    
      def extract_arguments
        def_line = file_line @line
      
        arguments_regex = /\w+,\s*(?:\w+)/
        def_line.scan /def(?:\(#{arguments_regex}\)|  #{arguments_regex})/
      end
    end  
  end
end
require 'inline_tests/definitions/base'

module InlineTests
  module Definitions
    class Base
    
      attr_reader :filename, :line
    
      def initialize(details = {})    
        @filename, @line = extract_file_and_lineno(details[:trace])
      end
      
      def code_binding
        binding
      end

      def comment
        if self.line      
          last_line = self.line - 1      
          first_line = last_line
      
          first_line -= 1 while first_line >= 1 && file_line(first_line - 1) =~ /\#/
      
          file_line(first_line..last_line).map do |line|
            line.sub(/\s*\#/, '')
          end.join
        else
          ""
        end
      end
    
      protected
    
      def file_line(num_or_range)
        if num_or_range.is_a?(Range)
          file_cache[(num_or_range.first - 1)..(num_or_range.last - 1)]
        else
          file_cache[num_or_range - 1]
        end
      end
    
      def file_cache
        self.class.file_cache(@filename)
      end
    
      def self.file_cache(filename)
        @file_cache ||= {}
        @file_cache[filename] ||= File.readlines(filename)
      end
    
      private
    
      def extract_file_and_lineno(stack)
        parse_stack_line(stack.first) unless stack.empty?
      end
    
      def parse_stack_line(where)
        if where =~ /^(.*):(\d+)/
          [ $1, Integer($2) ]
        end
      end
    
    end
  end
end
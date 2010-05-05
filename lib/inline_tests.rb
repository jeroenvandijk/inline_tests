require 'inline_tests/suite'

%w(class method module).each do |type|
  require "inline_tests/hooks/#{type}"
end

InlineTests::Suite.activate

at_exit { InlineTests::Suite.run }
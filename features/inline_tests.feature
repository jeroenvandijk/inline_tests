Feature: Inline tests
  In order to stimulate testing
  As a programmer
  I want to write tests where it happens

  @announce
  Scenario: testing simple method with TestUnit
    Given this gem is installed
    Given a file named "util.rb" with:
      """
      module Util
        # def test_hello
        #   assert(Object.new.extend(Util).hello("jeroen"), "hello jeroen")
        # end
        def hello(name)
          "hello #{name}"
        end
      end
      
      """

    When I run "inliner util.rb"
    Then I should see:
      """
      TEst
      
      """
Feature: Inline tests
  In order to stimulate testing
  As a programmer
  I want to write rspec tests where it happens

  @announce
  Scenario: testing simple method with Rspec
    Given this gem is installed
    Given a file named "util.rb" with:
      """
      module Util
        # it "should return the right name" do
        #   Object.new.extend(Util).hello("jeroen").should == "hello jeroen"
        # end
        def hello(name)
          "hello #{name}"
        end

        # it "should return the right name" do
        #   subject.hi("john").should == "hi john"
        # end
        def hi(name)
          "hi #{name}"
        end

        # specify { subject.howdy("jeroen").should == "howdy jeroen" }
        def howdy(name)
          "howdy #{name}"
        end

      end
      """

    When I run "inliner_spec util.rb"
    Then I should see:
      """
      3 examples, 0 failures
      """
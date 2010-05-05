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
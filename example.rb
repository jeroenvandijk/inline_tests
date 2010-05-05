module Util
  
  # def test_hello
  #   assert_equal(Object.new.extend(Util).hello("jeroen"), "hello jeroen")
  #   assert_equal(Object.new.extend(Util).hello("jeroefn"), "hello jeroend")
  #   assert(false)
  # end
  def hello(name)
    "hello #{name}"
  end
end
class Module
  # When a method is added to any class is called, assuming it is not overriden, 
  # This will register the method so present tests can be detected and put into context
  def method_added(method_name)
    InlineTests::Suite.parse(:context => self.name, :method => method_name, :trace => caller)
  end    
end
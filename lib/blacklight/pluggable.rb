module Blacklight::Pluggable
  
  # returns an array of plugin modules
  # also creates the @plugins array if it doesn't already exist
  def plugins
    @plugins ||= []
  end
  
  # use extend to bring-in plugin functionality:
  # class TheClass
  #   extend Blacklight::Pluggable
  #   plugin MyModule
  # end
  # 
  # The module (MyModule) passed to #plugin can:
  #   - have a self.configure(klass, opts) method, which can be used to setup the class (TheClass)
  #     - klass the class calling plugin (TheClass in the example above)
  #   - contain an InstanceMethods module (MyModule::InstanceMethods)
  #   - contain a ClassMethods module (MyModule::ClassMethods)
  # 
  # #plugin also accepts an options hash which can contain
  # any options -- these are passed to the plugin modules' self.configure method
  # ... but there are 2 special keys ...
  #   :instance_methods and :class_methods
  # Both of thses options are evaluated as boolean values.
  # 
  # :class_methods
  # If :class_methods => true, the ClassMethods module is included into the calling class
  # If :class_methods => false, the ClassMethods module is NOT included into the calling class
  # 
  # :instance_methods
  # If :instance_methods => true, the InstanceMethods module is extended into the calling class
  # If :instance_methods => false, the InstanceMethods module is NOT extended into the calling class
  def plugin mod, opts = {}
    opts = {:class_methods => true, :instance_methods => true}.merge(opts)
    extend mod::ClassMethods if opts[:class_methods] and mod.const_defined?(:ClassMethods)
    include mod::InstanceMethods if opts[:instance_methods] and mod.const_defined?(:InstanceMethods)
    mod.configure(self, opts) if mod.respond_to?(:configure)
    plugins << mod
  end
  
end
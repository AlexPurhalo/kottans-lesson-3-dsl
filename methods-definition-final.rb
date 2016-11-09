class Config
  def initialize(&block)
    instance_exec(&block)
  end

  def method_missing(name, *args)
    self.singleton_class.send(:define_method, name) do |value|
      return instance_variable_get("@#{name}") unless value # if no args provided
      instance_variable_set("@#{name}", value.size == 1 ? value[0] : value)
    end
    send(name, args)
  end
end

config = Config.new do
  port 8080
  host 'localhost'
  path '/tmp'
  password '123abaglamaga456'
end

p config # <Config:0x0055bc50694558 @port=8080, @host="localhost", @path="/tmp", @password="123abaglamaga456">
puts config.methods.include?(:port)         # port method is exist             => true
puts config.methods.include?(:other_method) # other_one method is not exist    => false
config.other_one('some value')              # adds a new method to other
puts config.methods.include?(:other_one)    # other_one method now is exist    => true
p config #<Config:0x0055caf77dc540 @port=8080, ..., @other_one="some value">






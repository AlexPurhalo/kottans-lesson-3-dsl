class Config
  def initialize(&block)
    instance_exec(&block)
  end

  def method_missing(name, *args)
    instance_variable_set("@#{name}", args.size == 1 ? args[0] : args)       # @host, "localhost" => @host="localhost"
    # puts "#{instance_variables}"                                                         # shows arrays of instances
    # instance_variables.each { |instance| puts instance }                              # shows all instance variables
    # instance_variables.each { |instance| puts instance_variable_get(instance.intern) } # shows arguments of instance
  end

end

config = Config.new do
  port 8080
  host 'localhost', 'go'
  path '/tmp'
  password '123abaglamaga456'
end

config # => #<Config:0x0055866e29b3b0 @port=8080, @host="localhost", @path="/tmp", @password="123abaglamaga456">


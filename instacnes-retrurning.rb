class Config
  def initialize(&block)
    instance_exec(&block)
  end

  def method_missing(name, *args)
    # args.empty? ? (puts "@#{name} without args, WARNING!!!") : (puts "@#{name} have following args: #{args} array")
    return instance_variable_get("@#{name}") if args.empty?                   # returns this line of no args provided

    instance_variable_set("@#{name}", args.size == 1 ? args[0] : args)  # returns this line of code if args are exist
    # args.empty? ?
    #     instance_variable_get("@#{name}") :
    #     instance_variable_set("@#{name}", args.size == 1 ? args[0] : args)
  end

end

config = Config.new do
  go
  port 8080
  host 'localhost'
  path '/tmp'
  password '123abaglamaga456'
end

puts config.password # 123abaglamaga456


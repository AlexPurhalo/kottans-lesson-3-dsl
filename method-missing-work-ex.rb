class Config
  def initialize(&block)
    instance_exec(&block)                      # instance_exec works with code blocks, instance_eval with strings
  end

  def method_missing(name, *args)
    puts "#{name}(#{args.map(&:inspect).join(', ')})" # port(8080), host('localhost'), greeting("hello", "world")
  end
end

config = Config.new do
  port 8080
  host 'localhost', 'fuck'
  path '/tmp'
  password '123abaglamaga456'
end

config
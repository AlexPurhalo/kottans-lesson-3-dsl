class A
  [:a, :b].each do |var|
    define_method(var) do
      puts "'#{var}' is a created method"
    end
  end
end

A.new.a
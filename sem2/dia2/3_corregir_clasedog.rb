=begin
class Dog
  def initialize(name, color)
    name = name
    color = color
  end

  def show_name
    name
  end

  def change_color(new_color)
    @color = new_color
  end

  def self.bark
    "GUA Gua"
  end
end

dog1 = Dog.new
dog2 = Dog.new
#test
p dog1.show_name
p dog1.bark == "GUA Gua GUA"
p dog2.bark == "GUA Gua GUA"
=end
class Dog
  def initialize(name, color)
    @name = name
    @color = color
  end

  def show_name
    @name
  end

  def change_color(new_color)
    @color = new_color
  end

  def bark
    "GUA Gua GUA"
  end
end

dog1 = Dog.new(1,2)
dog2 = Dog.new(1,2)
#test
p dog1.show_name
p dog1.bark == "GUA Gua GUA"
p dog2.bark == "GUA Gua GUA"
=begin
Refactoring Overriding
Refactoriza usando overriding o super y agrega el código necesario para que las pruebas sean true. Las pruebas no deben modificarse.
=end
class SuperSay
  def say(text)
    prepare_text(text)
  end

  def prepare_text(text)
    do_something_with(text)
  end
end

class HtmlSay < SuperSay
  def prepare_text(text)
    "<p>" + "You've refactored" + "</p>" #Overriding text
  end
end

class CssSay < SuperSay
  def do_something_with(text)
    text
  end
end

style = CssSay.new
doc = HtmlSay.new

#test
p doc.say("You've refactored") == "<p>You've refactored</p>"
p style.say("I like to code") == "I like to code"

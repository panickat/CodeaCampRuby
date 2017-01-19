=begin
Refactoring Super
Refactoriza el código. Revisa la documentación acerca de herencia y super. Haz pasar las pruebas.
=end
class A
  def b(a)
    'A.b'
  end
end

class B < A
  def b(a)
    if a == 5
      'B.b'
    else
      super b(a)
    end
  end
end
b = B.new
#test
p b.b(5) == "B.b"
p b.b(10) == "A.b"

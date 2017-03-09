helpers do
  p "helpers .."
  def grandma_answer(str)
    if str.downcase.include?("bye") || str.downcase.include?("adios")
      "Bye Mijito TQM"
    else
    is_upper?(str) ? "NO, NO DESDE 1983" : "HUH! NO TE ESCUCHO, HIJO!"
  end
  end

  def is_upper?(s)
    s == s.upcase ? true : false
  end

end

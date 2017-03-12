# log = ActiveRecord::Base.logger.level
# ActiveRecord::Base.logger.level = :info
#
# p start_t = Time.now
#
# File.open("#{__dir__}/test", "r") do |f|
#   f.each_line do |line|
#     line.chomp!
#     ActiveRecord::Base.transaction do
#         Word.create(word: line, canonical: line.split("").sort.join)
#     end
#
#   end
# end
#
# p end_t = Time.now
# p end_t - start_t
# ActiveRecord::Base.logger.level = log
## ALTER SEQUENCE words_id_seq RESTART WITH 1; # resetea la clave primaria
# 4.7 minutos vs 1.18 segundos lol
p start_t = Time.now

# Setup raw connection
  conn = ActiveRecord::Base.connection
  rc = conn.raw_connection
  rc.exec("COPY words (word,canonical) FROM STDIN WITH CSV")

  file = File.open("#{__dir__}/words", 'r')
  while !file.eof?
    # Add row to copy data
    line = file.readline.chomp
    rc.put_copy_data(line + "," + line.downcase.chars.sort.join + "\n")

  end

  # We are done adding copy data
  rc.put_copy_end

  p end_t = Time.now
  p end_t - start_t

  # Display any error messages
  while res = rc.get_result
    if e_message = res.error_message
      p e_message
    end
  end

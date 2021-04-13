require './jlpt2'

jlpt2.each do |entry|
    puts entry[:kanji]
end
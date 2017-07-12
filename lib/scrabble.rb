class Scrabble

  def score(word)
    1
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score(word, score = 0)
    word_array = word.chars
    word_array.each do |letter|
      score += point_values[letter.upcase]
    end
    score
  end

  def get_multiplied_word_score(word, multiplier_array, score = 0)
    word_array = word.chars
    word_array.each_with_index do |letter, index|
      score += point_values[letter.upcase] * multiplier_array[index]
    end
    score
  end

  def get_word_score(word, word_array = [])
    word_array = word.chars
    word_array.each_with_index do |letter, index|
      word_array[index] = convert_letter_to_point_value(letter.upcase)
    end
    word_array.join('+')
  end

  def score_with_multipliers(word, multiplier_array, multiplier = 1, score = 0)
    score = get_multiplied_word_score(word, multiplier_array)
    score * multiplier
  end

end

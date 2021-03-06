class PigLatin

  def initialize(word)
    @first_letter = word[0].to_s
    @second_letter = word[1].to_s
    @third_letter = word[2].to_s
  end

  def self.translate(word)
    new_word = new(word)
    if word.start_with?("a", "e", "i", "o", "u", "yt", "xr")
      new_word.vowel_rearrange(word)
    elsif word.include?(" ")
      new_word.translate_phrase(word)
    elsif word.start_with?("squ", "sch", "thr")
      new_word.rearrange_three(word)
    elsif word.start_with?("ch", "qu", "th")
      new_word.rearrange_two(word)
    else
      new_word.basic_rearrange(word)
    end
  end

  def vowel_rearrange(word)
    word.to_s + "ay"
  end

  def basic_rearrange(word)
    delete_first(word) + @first_letter + "ay"
  end

  def rearrange_two(word)
    delete_first(word).delete(@second_letter) + @first_letter + @second_letter + "ay"
  end

  def rearrange_three(word)
    if word.chars.last == "h"
      delete_first(word).delete(@second_letter).delete(@third_letter) + "h" + @first_letter + @second_letter + @third_letter + "ay"
    else
      delete_first(word).delete(@second_letter).delete(@third_letter) + @first_letter + @second_letter + @third_letter + "ay"
    end
  end

  def translate_phrase(phrase)
    phrase_array = phrase.split.map { |word| word }
    translation = phrase_array.map { |x| PigLatin.translate(x) }
    translated_phrase = translation.each { |word| word }.join(" ")
    translated_phrase
  end

  private

  def delete_first(word)
    word.delete(@first_letter)
  end

end

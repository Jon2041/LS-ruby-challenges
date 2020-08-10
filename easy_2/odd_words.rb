=begin
P - Given a string with a word (max 20 chars) or words separated by spaces, and ending with a
  period, output the text such that each word in an odd position is reversed and
  the string still terminates with a period.

  BONUS POINT: Read the string one character at a time and output the characters
  one at a time.

  Verify: Whether to mutate the caller?

E - a string with one word - a string with no period
D - Strings, arrays
A - Verify that the string includes a period - raise an error otherwise.
    Initialize 'result', an empty string
    Initialize 'reverse', a Boolean, with value false.
    UNTIL the string is empty, do
     IF Reverse is true
      LOOP from index of a space or period minus 1, down to 0
       - result += Slice!(index)
      END
      result += Slice!(0)
     ELSE
      LOOP from 0 up to index of space or period
       - result += Slice!(index)
      END
     toggle reverse
     END
    END

C
=end

#BONUS
def cleanup(string)
  new_string = string
  while new_string.include?("  ") do
    new_string.gsub!(/  /, ' ')
  end
  while new_string.include?(" .") do
    new_string.gsub!(/ \./, '.')
  end
  new_string
end

def rev_odd_words(string)
  raise StandardError, "String must include a period." unless string.include?('.')

  result = ''
  reverse = false
  working_string = cleanup(string)

  until working_string.empty? do
    i = working_string.index(/( |\.)/)
    if reverse
      (i - 1).downto(0) do |ind|
        result += working_string[ind]
      end
        result += working_string[i]
    else
      0.upto(i) do |ind|
        result += working_string[ind]
      end
    end
    working_string[0..i] = ''
    reverse = !reverse
  end

  result
end

def ez_rev_odd(str)
  raise StandardError, "String must include a period." unless str.include?('.')

  words = str.delete('.').split

  words.map!.with_index do |word, ind|
    if ind.odd?
      word.reverse!
    else
      word
    end
  end

  words.join(' ') + '.'
end

p ez_rev_odd('Hello.')
p ez_rev_odd('Hi there.')
p ez_rev_odd('mm peas and carrots.')
p ez_rev_odd('An apple a day keeps the doctor away.')
p rev_odd_words('Hello world .')
p rev_odd_words('Hello  world.')
p rev_odd_words('Hello world  .')

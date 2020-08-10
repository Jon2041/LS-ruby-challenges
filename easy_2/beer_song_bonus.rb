class ZeroVerse
  def lyric(number)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class OneVerse
  def lyric(number)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class TwoVerse
  def lyric(number)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class DefaultVerse
  def lyric(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end
end

class BeerSong
  def verse_lookup(number)
    lookup = { [0] => ZeroVerse,
               [1] => OneVerse,
               [2] => TwoVerse,
               3..99 => DefaultVerse
             }
    verse_format = lookup.select { |k, _| k.include?(number) }.values.first
    verse_format.new.lyric(number)
  end

  def verses(first, last)
    this_verse = first
    result = []
    while this_verse >= last do
      result << verse_lookup(this_verse)
      this_verse -= 1
    end
    result.join("\n")
  end

  def verse(number)
    verses(number, number)
  end

  def lyrics
    verses(99, 0)
  end
end

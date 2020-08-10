class BeerSong
  def create_verse(verse)
    lyric = { number: verse.to_s + " bottles", instructions: "Take one down and pass it around",
              next_num: (verse - 1).to_s + " bottles"}
    case verse
    when 0 then zero_lyric(lyric)
    when 1 then one_lyric(lyric)
    when 2 then lyric[:next_num] = "1 bottle"
    end

    "#{lyric[:number].capitalize} of beer on the wall, #{lyric[:number]} of beer.\n" \
    "#{lyric[:instructions]}, #{lyric[:next_num]} of beer on the wall.\n"
  end

  def one_lyric(lyric)
    lyric[:number] = "1 bottle"
    lyric[:instructions] = "Take it down and pass it around"
    lyric[:next_num] = "no more bottles"
  end

  def zero_lyric(lyric)
    lyric[:number] = "no more bottles"
    lyric[:instructions] = "Go to the store and buy some more"
    lyric[:next_num] = "99 bottles"
  end

  def verse(number)
    verses(number, number)
  end

  def verses(first, last)
    this_verse = first
    these_verses = ""
    while this_verse >= last do
      these_verses += create_verse(this_verse)
      this_verse -= 1
      these_verses += "\n" if this_verse >= last
    end
    these_verses
  end

  def lyrics
    verses(99, 0)
  end
end

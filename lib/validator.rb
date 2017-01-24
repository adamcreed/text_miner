# You're not the boss of me, rubocop!
class Validator
  def is_binary?(text)
    # Selects 0 and 1, or empty space, and discards the rest
    input = text.scan(/[01]|^$/)
    input == text.chars
  end

  def is_binary_even?(text)
    is_binary?(text) and text.to_i.even?
  end

  def is_hex?(text)
    # Checks for a non-hex char, or an empty string
    input = text.scan(/\h|^$/)
    input == text.chars
  end

  def is_word?(text)
    # This one's ugly, but the clean way's eluding me at the moment.
    # Checks for anything not a letter, dash or number,
    # or if the text is only numbers, or an empty string
    text =~ /[^a-z\-\d]+|^\d+$|^$/i ? false : true
  end

  def are_words?(text, options = {})
    # Splits words on non-"word" chars except hyphen
    # Also catches empty strings
    words = text.scan(/[\w\-]+|^$/)
    count = options.fetch(:count, words.size)
    words.each { |word| return false unless is_word?(word) }
    words.size == count
  end

  def is_phone_number?(text)
    # Puts all the numbers into a single string
    input = text.scan(/\d+/).join
    # Returns true if input is 7 or 10 digits
    input =~ /^\d{7}(?:\d{3})?$/ ? true : false
  end

  def is_money?(text)
    # Thomas showed me this; I googled the (?: and kinda get what it is,
    # but I don't really understand why it works here.

    # Checks the beginning of text for a dollar, followed optionally
    # by groups of three digits separated by a comma,
    # followed optionally by a decimal and two digits
    text =~ /^\$\d+(?:,?\d{3})*(?:\.\d{2})?$/ ? true : false
  end

  def is_zip_code?(text)
    # Puts all the numbers into a single string
    input = text.scan(/\d+/).join
    # Returns true if input is 5 or 9 digits
    input =~ /^\d{5}(?:\d{4})?$/ ? true : false
  end

  def is_date?(text)
    # Checks for a 1-4 digit number, followed by a forward slash or hyphen,
    # then a 1-2 digit number and another separator, then another 1-4 digits
    text =~ /^\d{1,4}[\/-]\d{1,2}[\/-]\d{1,4}/ ? true : false
  end
end

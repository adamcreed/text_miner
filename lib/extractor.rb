# Pulls data from a selection of text
class Extractor
  def phone_numbers(text)
    # Looks for a phone number in the format of (123) 456-7890
    text.scan(/\(\d{3}\) \d{3}-\d{4}/)
  end

  def emails(text)
    # Looks for any chars that might or might not have period separators,
    # followed by @, then more letters, a period, and at least more two letters
    text.scan(/(?:\w+\.)*\w+@\w+\.\w{2,}/)
  end
end

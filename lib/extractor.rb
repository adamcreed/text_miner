class Extractor
  def phone_numbers(text)
    text.scan(/\(\d{3}\) \d{3}-\d{4}/)
  end
end

class Separator
  def words(text)
    pattern = /(?:\d+-)?[a-z\-]+/
    text.scan(pattern) if text =~ pattern
  end
end

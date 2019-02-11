json.headers do
  @headers.each do |name, value|
    json.set! format_header_name(name), value
  end
end
require 'nokogiri'

class ContenToHtml

  def create_html(content, filename = 'index.html')
    file = File.new("#{Dir.pwd}/#{filename}", "w+")
    file.puts "<!DOCTYPE html>"
    file.puts "  <head>"
    file.puts "    <meta charset='utfile-8'>"
    file.puts "    <title>Гра Тамагочі from RubyCops</title>"
    file.puts "  </head>"
    file.puts "  <body>"
    file.puts "      #{content}"
    file.puts "  </body>"
    file.puts "</html>"
    file.close
  end
end
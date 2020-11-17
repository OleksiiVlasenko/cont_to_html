
class ContenToHtml
  def create_html(content, bypass_html, filename = 'index.html')
    res = content.gsub!(/[<>]/, '') if bypass_html == false #kill all <>
    res = content unless bypass_html == false

    file = File.new("#{Dir.pwd}/#{filename}", "w+")
    file.puts "<!DOCTYPE html>"
    file.puts "<html lang=""en"">"
    file.puts "  <head>"
    file.puts "    <meta charset='utf-8'>"
    file.puts "    <title>Гра Тамагочі from RubyCops</title>"
    file.puts "  </head>"
    file.puts "  <script>"
    file.puts "   setInterval(()=>{window.location.reload()}, 1500)"
    file.puts "</script>"
    file.puts "  <body>"
    file.puts "      #{res}"
    file.puts "  </body>"
    file.puts "</html>"
    file.close
  end

  def open_html(file = 'index.html')
    system("xdg-open #{Dir.pwd}/#{file}")
  end

  def update(content, filename = 'index.html')
    look_for     = "<body>"
    replace_with = "
        <body>
          #{content}
        </body>
    </html>"
    File.open('index.html', 'r+') do |file|
      file.each_line do |line|
        if line[look_for]
          file.seek(-(line.length + 1), IO::SEEK_CUR)
          file.write line.gsub(look_for, replace_with)
        end
      end
    end
  end

end
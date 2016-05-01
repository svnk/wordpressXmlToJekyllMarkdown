require 'nokogiri'
require 'upmark'
require 'time'
require 'safe_yaml'
File.open("export.xml") do |file|
  items = Nokogiri::XML(file).xpath("//channel//item")
  items.each do |item|
    name = item.at_xpath("wp:post_name").text.strip
    author = item.at_xpath("dc:creator").text.strip
    content = item.at_xpath("content:encoded").text
    begin
      content = Upmark.convert(item.at_xpath("content:encoded").text)
    rescue
      p 'error parsing '+name
    end 
    date_str = item.at_xpath("wp:post_date").text + " +0000"
    date = Time.parse(date_str)
    filename = date.strftime("%Y-%m-%d-"+name+".md")
    path = 'posts/'+filename

    header = {
            'layout' => 'post',
            'title' => name,
            'author' => author,
    }
    File.open(path, 'w') do |f|
      f.puts header.to_yaml
      f.puts "---\n\n"
      f.puts content
    end
  end
end

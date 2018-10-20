require 'nokogiri'
require 'open-uri'
require 'pry'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

repo_list_items = page.css(".repo-list li")
js_repo_count = 0
language_na = []
repo_list_items.each do |item|
  puts item.css("h3")[0].text.strip
  puts "==========================="
  puts item.css(".pr-4").inner_html.split('> ').last.strip
  puts
  language = item.css(".f6").css('span').children[3].inner_text.strip
  if language == ""
    language = "N/A"
    language_na << item.css("h3")[0].text.strip.split('/ ')[1]
  elsif language.downcase == "javascript"
    js_repo_count += 1
  end
  puts "Primary Language: " + language
  puts
  contributorsBulk = repo_list_items[0].css(".avatar")
  contributors = []
  contributorsBulk.each do |line|
    contributors << line.attributes["alt"].value.split('@')[1]
  end
  puts "Primary Contributors: " + contributors.join(', ')
  puts "---------------------------"
  puts
end

puts "JavaScript repository count: " + js_repo_count.to_s
puts "Repositories with unspecified programming language: " + language_na.join(', ')

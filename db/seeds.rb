require 'nokogiri'
require 'open-uri'
require 'pry'

TRENDING_URL = 'https://github.com/trending?since=weekly'
page = Nokogiri::HTML(open(TRENDING_URL))

repo_list_items = page.css(".repo-list li")

repo_list_items.each do |item|
  owner = item.css("h3")[0].text.strip.split(' / ')[0]
  name = item.css("h3")[0].text.strip.split(' / ')[1]
  description = item.css(".pr-4").inner_html.split('> ').last.strip
  language = item.css(".f6").css('span').children[3].inner_text.strip
  if language == ""
    language = "N/A"
  end
  contributorsBulk = repo_list_items[0].css(".avatar")
  contributors = []
  contributorsBulk.each do |line|
    contributors << line.attributes["alt"].value.split('@')[1]
  end
  new_repo = Repository.create({
    owner: owner,
    name: name,
    description: description,
    language: language,
    contributors: contributors,
  })
end

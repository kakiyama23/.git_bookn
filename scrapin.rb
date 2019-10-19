require 'mechanize'
  agent = Mechanize.new
  page = agent.get("http://kc.kodansha.co.jp/product?item=0000323878")
  open_date = page.at('.spaceSp tr td').inner_text if page.at('.spaceSp tr td')
  puts open_date

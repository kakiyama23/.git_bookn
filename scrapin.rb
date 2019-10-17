require 'mechanize'
    agent = Mechanize.new
    page = agent.get("http://kc.kodansha.co.jp/new_comics")
    titles = page.search('.title')
    titles.each do |title|
        puts title.inner_text
    end
    
    images = page.search('.itemImg img')
    images.each do |image_url|
        puts image_url.get_attribute('src')
    end
    
    
 
class Scraping
  def self.get_product
    agent = Mechanize.new
    page = agent.get("http://kc.kodansha.co.jp/new_comics")
    elements = page.search('.title') if page.search('.title')
    elementss = page.search('.itemImg img') if page.search('.itemImg img')
    elementsss = page.search('.date') if page.search('.date')
    elementssss = page.search('.author') if page.search('.author')
    
    elements.zip(elementss,elementsss,elementssss).each do |titles,image_urls,open_dates,directors|
      title = titles.inner_text
      image_url = image_urls.get_attribute('src')
      open_date = open_dates.inner_text
      director = directors.inner_text
      product = Product.where(title: title, image_url: image_url, open_date: open_date, director: director).first_or_initialize
      product.save
  end
  end
end

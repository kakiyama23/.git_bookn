class Scraping
def self.book_urls
  urls = []
  agent = Mechanize.new
  current_page = agent.get("http://kc.kodansha.co.jp/new_comics")
  elements = current_page.search('.detail')
  elements.each do |ele|
   urls << ele.get_attribute('href')
  end
  urls.each do |url|
    get_product(url)
  end

end

def self.get_product(url)
  agent = Mechanize.new
  page = agent.get(url)
  title = page.at('.titStyle').inner_text if page.at('.titStyle')
  image_url = page.at('.lineImg img')[:src] if page.at('.lineImg img')
  director = page.at('.author a').inner_text if page.at('.author a')

  product = Product.where(title: title).first_or_initialize
  product.image_url = image_url
  product.director = director
  product.save
end
end


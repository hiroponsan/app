class Scraping 

  def self.get_products
    agent = Mechanize.new
    num  = 1
    while num <= 32 do
      links = []
      page = agent.get("http://syllabus.chuo-u.ac.jp/syllabus/conditions-result/?controller=syllabus&action=conditions-result&module=default&search=search&ju_kamoku=&ju_kyouin=&kana=&k_code=1C&gakki=&free_word=&pageID=" + "#{num}")
      elements = page.search('table tr td')
      elements.each do |ele|
        links << ele.children[0][:href] if ele.children[0][:href].present? && ele.children.children.inner_text == "詳細"
      end
      links.each do |link|
        get_product(link)
      end
      num += 1
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    body = page.search('table tr td')
    title = body[0].inner_text
    year = body[1].inner_text
    professer = body[3].inner_text
    url = link
    product = Product.where(:url => url).first_or_initialize
    product.title = title
    product.year = year
    product.professer = professer
    product.save
  end

end








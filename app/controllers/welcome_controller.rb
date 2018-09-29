class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @a = params[:query]
  end

 

  def search
    # Dennis Lloyd - NEVERMIND
    require 'nokogiri'
    require 'open-uri'
    url       = 'https://youtube.com/results?search_query='

    # url_text = Net::HTTP.get(url + params[:query])
    # page = Nokogiri::XML(url_text)
    # puts url_text
    page = Nokogiri::HTML(open(url + params[:query])) 
     p page
    
    arr = []
    attr = page.xpath('//a[contains(@href, "watch?")]')
    attr.map {|element| arr.push('https://youtube.com' + element["href"])}
    
    # options = Selenium::WebDriver::Chrome::Options.new
    
    # options.add_argument('--disable-extensions')
    # options.add_argument('--headless')
    # options.add_argument('--disable-gpu')
    # options.add_argument('--no-sandbox')
    # options.add_argument('--disable-dev-shm-usage')
     
   
     
    # driver = Selenium::WebDriver.for :chrome,options: options

    # driver.manage.window.resize_to(1300, 500)
  
    #  query     = CGI.escape(params[:query])
    #  url       = 'http://youtube.com/results?search_query='
    #  page      = driver.navigate.to(url + query)
     
    #  u = driver.find_elements(:xpath, '//a[contains(@href, "watch?")]')
     # driver.quit
    $video_url = []
    $file = []
    (0..24).each do |i|
      next unless i.even?
   
      str = arr[i]
      
      puts arr[i]
    
      $file.push(str)
      str = str.split('/')
      str[3] = str[3].split('?v=')
      str[3][0] = 'embed'
      str = str.join('/')
      $video_url.push(str)
    
    end

    redirect_to :show_index
  end
 
   
   
      
  end

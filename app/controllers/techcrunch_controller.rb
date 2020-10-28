class TechcrunchController < ApplicationController
  require "open-uri"
  require "nokogiri"
  require "robotex"

  def index
    robotex = Robotex.new
    p robotex.allowed?("https://jp.techcrunch.com/")

    url = 'https://jp.techcrunch.com/'
    user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
    charset = nil
    html = open(url, "User-Agent" => user_agent) do |f|
      charset = f.charset
      f.read
    end

    @doc = Nokogiri::HTML.parse(html, nil, charset)
    # count = 0
    # data = []
    # @techcrunch = doc.css('ul#river1 > li.river-block > div.block > div.block-content > h2.post-title > a').first(10).each do |link|
      # count += 1
      # url = link.css("a")[0][:href]
      # name = link.css("a").text
      # puts "name: #{name}, url: #{url}"
    # end
  end
end

class TechcrunchController < ApplicationController
  require "open-uri"
  require "nokogiri"
  require "robotex"
  require "csv"

  def index
    urls = [
      "https://jp.techcrunch.com/",
      "https://www.gizmodo.jp/articles/",
    ]

    @docs = []
    urls.each do |url|
      robotex = Robotex.new
      p robotex.allowed?(url)

      user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
      charset = nil
      html = open(url, "User-Agent" => user_agent) do |f|
        charset = f.charset
        f.read
      end

      doc = Nokogiri::HTML.parse(html, nil, charset)
      @docs << doc
    end



    # robotex = Robotex.new
    # p robotex.allowed?("https://jp.techcrunch.com/")

    # url = 'https://jp.techcrunch.com/'
    # user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
    # charset = nil
    # html = open(url, "User-Agent" => user_agent) do |f|
    #   charset = f.charset
    #   f.read
    # end

    # @doc = Nokogiri::HTML.parse(html, nil, charset)
  end
end

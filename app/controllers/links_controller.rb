class LinksController < ApplicationController
  require "open-uri"
  require "nokogiri"
  require "robotex"
  before_action :docs

  def index
  end

  def page2
  end

  def page3
  end

  def page4
  end

  def page5
  end

  def page6
  end
  
  def docs
    urls = [
      "https://jp.techcrunch.com/",
      "https://www.gizmodo.jp/articles/",
      "https://electrek.co/",
      "https://www.tesmanian.com/",
      "https://www.macrumors.com/",
      "https://towardsdatascience.com/"
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
  end

end

# encoding: UTF-8
require 'open-uri'
require 'nokogiri'

class Gdocstatic::StaticPage 
  attr_accessor :path, :document_id

  def initialize(path, document_id)
    @path = path
    @document_id = document_id
    @fetched = false
  end

  def title
    @fetched ||= fecth_document
    @title
  end

  def body
    @fetched ||= fecth_document
    @body
  end

  protected
  URL_BASE = 'https://docs.google.com/document/'
  def fecth_document
    url = "#{URL_BASE}pub?id=#{@document_id}"
    html = open(url).read
    page = ::Nokogiri::HTML(html, nil, 'utf-8')
    page.encoding = 'utf-8'

    @title = page.xpath("//title").text
    body = page.xpath('//div[@id="contents"]')
    #page.xpath("//head").remove
    body.xpath("//script").remove
    body.xpath("//style").remove
    body.xpath("//@style").remove
    #@body.xpath("//img").each do |img|
    #  img['src'] = "#{StaticPages.url_base}#{img['src']}" if img['src'].present? 
    #end
    @body = body.to_html
  end

end


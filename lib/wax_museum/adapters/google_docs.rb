module WaxMuseum
  module Adapters

    class GoogleDocs
      URL_BASE = 'https://docs.google.com/document/'

      def self.url_for(id)
        "#{URL_BASE}pub?id=#{id}"
      end

      def initialize(response)
        @html = ::Nokogiri::HTML(response, nil, 'utf-8')
      end

      def title
        @html.xpath("//title").text
      end

      def body
        body = @html.xpath('//div[@id="contents"]')
        if body
          body.xpath("//script").remove
          body.xpath("//style").remove
          body.xpath("//@style").remove
          body.xpath("//img").each do |img|
            img['src'] = "#{URL_BASE}#{img['src']}" if img['src'].present? 
          end
          body.to_html
        else
          ''
        end
      end
    end

  end
end

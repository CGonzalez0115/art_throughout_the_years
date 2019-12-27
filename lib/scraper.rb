class ArtThroughoutTheYears::Scraper
  
  def self.scrape_art
    doc = Nokogiri::HTML(open("https://www.timeout.com/newyork/art/top-famous-paintings-in-art-history-ranked"))
    doc.css("article.listCard.theme--red.category_10 .xs-mx4.md-mx0.xs-mb5.sm-pb5.sm-border-bottom.border-1.xs-full-width.xs-flex.xs-flex-column.sm-flex-row.sm-flex-wrap").each do |work|
      artwork = {}
      artwork[:number] = work.css("div.FranklinGothic.number.xs-absolute.xs-text-center.xs-z1.xs-text-4.xs-line-height-2.xs-fill-charcoal.xs-text-white.squared.xs-px3").text
      artwork[:title_artist_year] = work.css("h3.card-title.xs-text-charcoal.FranklinGothic.xs-text-2.xs-line-height-2.xs-mb4").text
      artwork[:description] = work.css("div.xs-text-7.xs-line-height-6.xs-text-charcoal").text
      works << artwork
    end
  end
end
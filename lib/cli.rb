class ArtThroughoutTheYears::CLI
  
  def call
    ArtThroughoutTheYears::Scraper.scrape_art
    start
    list_pieces
    print_artwork
  end

  def start
    puts ""
    puts "************* ~The Most Popular Paintings Throughout History~ *************"
    puts ""
  end

  def list_pieces(from_number)
    puts ""
    puts "Please view the list of paintings below"
    puts ""
    @pieces = ArtThroughoutTheYears::WorksofArt.all[from_number-1, 10]
    @pieces.each.with_index(from_number) do |piece, index| 
      puts "#{index}. #{piece.title_artist_year}"
    end
  end
  
  def print_artwork
    puts ""
    puts "Please enter the number of the listed work you would like to view."
    input = gets.strip
    if input.to_i > 0
      artwork = ArtThroughoutTheYears::WorksofArt.find_by_index(
      puts ""
      puts "-------------- #{artwork.title_artist_year} --------------"
      puts ""
      puts "Information: #{artwork.description}"
      puts ""
      print_artwork
    elsif input == "Exit"
      puts ""
      puts "Thank you for visiting, have a good day!"
      puts ""
    else 
      puts ""
      puts "Review the list below"
      list_pieces
    end
  end
end
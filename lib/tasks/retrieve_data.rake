desc "Use the 3taps API to add entries to database"
task scrape: :environment do
  require 'rubygems'
  require 'open-uri'
  require 'uri'
  require 'json'
  
  auth_token = "4df4bbf8a2d0cfffc69fb3486f11b6a0"
  # search_url = "http://search.3taps.com"
  poll_url = "http://polling.3taps.com/poll"
  
  loop do
    # Construct query
    params = { 
      auth_token: auth_token,
      anchor: Key.find_by(key: "anchor").value,
      retvals: "heading,body,price,timestamp,location,images,external_url",
      "location.city" => "USA-NYM-BRL",
      source: "CRAIG",
      category_group: "RRRR",
      category: "RHFR"
    }
    
    # Submit request
    uri = URI.parse(poll_url)
    uri.query = URI.encode_www_form(params)
    result = JSON.parse(open(uri).read)
    
    # Run diagnostics
    puts "There are #{result["postings"].length} postings"
    puts "Database anchor is #{Key.find_by(key: "anchor").value}"
    puts "New anchor is #{result["anchor"]}"
    
    # first_listing = result["postings"].last
    # puts first_listing["images"]
    # first_listing["images"].each do |image|
    #   puts image["full"]
    # end
    
    # Add listings to database
    result["postings"].each do |listing|
      Pad.create(
        heading: listing["heading"],
        body: listing["body"],
        price: listing["price"],
        timestamp: Time.at(listing["timestamp"]),
        external_url: listing["external_url"]
      )
    end
    
    # Reset anchor in database
    Key.find_by(key: "anchor").update(value: result["anchor"])
    puts "New database anchor is #{Key.find_by(key: "anchor").value}"
    
    break if result["postings"].empty?
  end 
  

  # result["postings"].each do |listing|
  #   Pad.create(
  #     heading: listing["heading"],
  #     body: listing["body"],
  #     price: listing["price"],
  #     timestamp: listing["timestamp"],
  #     external_url: listing["external_url"] 
  #   )
  # end
  
  # puts listing[0]["heading"]
  
  # @pad = Pad.create(
  #   heading: listing[0]["heading"],
  #   body: listing[0]["body"],
  #   price: listing[0]["price"],
  #   external_url: listing[0]["external_url"]  
  # )
end